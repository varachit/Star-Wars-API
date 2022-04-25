from rest_framework import authentication, generics, permissions
from django.db.models import Q
from django.conf import settings
import redis

from statistics import multimode

from .authentication import CustomTokenAuthentication
from .models import Starship, Planet, Person
from .serializers import StarshipSerializer, PlanetSerializer, PersonSerializer

# redis_instance = redis.StrictRedis(host=settings.REDIS_HOSTNAME, port=settings.REDIS_PORT, db=0,
#                                    username=settings.REDIS_USERNAME, password=settings.REDIS_PASSWORD)

redis_instance = redis.StrictRedis(host=settings.REDIS_HOSTNAME,
                                   port=settings.REDIS_PORT, db=0)


class MostPilotedStarshipListView(generics.ListAPIView):
    planet_queryset = Planet.objects.all()
    resident_queryset = Person.objects.all()
    starship_queryset = Starship.objects.all()
    serializer_class = StarshipSerializer
    authentication_classes = [
        authentication.SessionAuthentication,
        CustomTokenAuthentication
    ]
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def get_queryset(self):
        raw_params = self.request.query_params.get('planet')  # Getting parameters

        if raw_params is not None:  # If parameters is not null or empty
            # Convert parameters to list, String: Sullust, Corellia, Kashyyyk -> ['Sullust', 'Corellia', 'Kashyyyk']
            planets_params = [each_param.strip() for each_param in raw_params.split(',')]
            planets_q = Q()  # Q Object - encapsulated SQL expression
            for each_planet_param in planets_params:
                planets_q = planets_q | Q(name__iexact=each_planet_param)

            # If caching is enabled
            if settings.REDIS_CACHING:
                key_name = 'mostPilotedStarship_' + raw_params.replace(' ', '')  # Cache Key Name
                value = redis_instance.get(key_name)  # Attempt to get from cache server

                if value:  # If true, cache is exists
                    if settings.DEBUG:
                        print('Serving cache')
                    cache_params = value.decode('utf8').split(' ')  # Convert cached value back to ID List
                    return self.starship_queryset.filter(id__in=cache_params)  # Filter using cached Starship ID
                else:  # No cache, talk to database
                    if settings.DEBUG:
                        print('Serving from database')

                    result, starship_params = self.find_most_piloted_starship(planets_q, True)

                    # Caching, convert the starship results to String with whitespace delimiter.
                    # Sullust, Corellia, Kashyyyk -> "10"
                    # Corellia -> "10 17 12"
                    cache_value = ' '.join([str(starship) for starship in starship_params])
                    redis_instance.set(key_name, cache_value, int(settings.REDIS_TTL))
                    return result
            else:  # If caching is disabled
                return self.find_most_piloted_starship(planets_q) or Starship.objects.none()
        return Starship.objects.none()  # If parameters is empty, return the empty queryset

    def find_most_piloted_starship(self, planet_query_params, caching_mode=False):
        planet_qs = self.planet_queryset.filter(planet_query_params)  # Filter planets with params
        resident_params = planet_qs.values_list('residents__id', flat=True)  # Get filtered residents' ID
        resident_qs = self.resident_queryset.filter(id__in=resident_params)  # Filter residents
        starship_list = resident_qs.values_list('starships__id', flat=True)  # Get starships from residents

        # Some resident does not have their own starship, So, None type exists
        # Convert Starship ID from the filtered starships_list to Integer List using List Comprehension
        starships = [int(each_starship) for each_starship in starship_list if each_starship is not None]

        # Multimode from Statistics Package to find maximum occurrence or multiple mode if exists
        starship_params = multimode(starships)

        # After getting Starship ID that have the most occurrence or is the most piloted ship(s)
        # Filter it from all the starship. So, only the most piloted starship(s) is/are returned
        starships_qs = self.starship_queryset.filter(id__in=starship_params)

        if caching_mode:  # If caching mode is on, return both result and params for caching purposes
            return starships_qs, starship_params
        return starships_qs


# Starship View
class StarshipListCreateAPIView(generics.ListCreateAPIView):
    queryset = Starship.objects.all()
    serializer_class = StarshipSerializer
    authentication_classes = [
        authentication.SessionAuthentication,
        CustomTokenAuthentication
    ]
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def perform_create(self, serializer):
        serializer.save()


class StarshipDetailAPIView(generics.RetrieveAPIView):
    queryset = Starship.objects.all()
    serializer_class = StarshipSerializer
    authentication_classes = [
        authentication.SessionAuthentication,
        CustomTokenAuthentication
    ]
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]


class StarshipUpdateAPIView(generics.UpdateAPIView):
    queryset = Starship.objects.all()
    serializer_class = StarshipSerializer
    authentication_classes = [
        authentication.SessionAuthentication,
        CustomTokenAuthentication
    ]
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    lookup_field = 'pk'

    def perform_update(self, serializer):
        serializer.save()


class StarshipDestroyAPIView(generics.DestroyAPIView):
    queryset = Starship.objects.all()
    serializer_class = StarshipSerializer
    authentication_classes = [
        authentication.SessionAuthentication,
        CustomTokenAuthentication
    ]
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    lookup_field = 'pk'

    def perform_destroy(self, instance):
        super().perform_destroy(instance)


class StarshipListSearchView(generics.ListAPIView):
    queryset = Starship.objects.all()
    serializer_class = StarshipSerializer
    authentication_classes = [
        authentication.SessionAuthentication,
        CustomTokenAuthentication
    ]
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def get_queryset(self, *args, **kwargs):
        qs = super().get_queryset()
        q = self.request.GET.get('name')

        if q is not None:  # If parameter is exists
            user = None
            if self.request.user.is_authenticated:
                user = self.request.user

            if settings.REDIS_CACHING:  # If caching is enabled
                key_name = f"Starship_{q.replace(' ', '')}"
                value = redis_instance.get(key_name)
                if value:  # Cache exists
                    if settings.DEBUG:
                        print('Serving cache')
                    cache_params = value.decode('utf8').split(' ')
                    return self.queryset.filter(id__in=cache_params).order_by('name')
                else:  # No cache found
                    if settings.DEBUG:
                        print('Serving from database')
                    results = qs.search(q, user=user).order_by('name')
                    limited_results = results[:10]
                    cache_value = ' '.join([str(each_result) for each_result
                                            in limited_results.values_list('id', flat=True)])
                    redis_instance.set(key_name, cache_value, int(settings.REDIS_TTL))
                    return results
            else:  # If caching is disabled
                results = qs.search(q, user=user).order_by('name')
                return results[:10]
        return Starship.objects.none()


# Planet View
class PlanetListCreateAPIView(generics.ListCreateAPIView):
    queryset = Planet.objects.all()
    serializer_class = PlanetSerializer
    authentication_classes = [
        authentication.SessionAuthentication,
        CustomTokenAuthentication
    ]
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def perform_create(self, serializer):
        serializer.save()


class PlanetDetailAPIView(generics.RetrieveAPIView):
    queryset = Planet.objects.all()
    serializer_class = PlanetSerializer
    authentication_classes = [
        authentication.SessionAuthentication,
        CustomTokenAuthentication
    ]
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]


class PlanetUpdateAPIView(generics.UpdateAPIView):
    queryset = Planet.objects.all()
    serializer_class = PlanetSerializer
    authentication_classes = [
        authentication.SessionAuthentication,
        CustomTokenAuthentication
    ]
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    lookup_field = 'pk'

    def perform_update(self, serializer):
        serializer.save()


class PlanetDestroyAPIView(generics.DestroyAPIView):
    queryset = Planet.objects.all()
    serializer_class = PlanetSerializer
    authentication_classes = [
        authentication.SessionAuthentication,
        CustomTokenAuthentication
    ]
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    lookup_field = 'pk'

    def perform_destroy(self, instance):
        super().perform_destroy(instance)


class PlanetListSearchView(generics.ListAPIView):
    queryset = Planet.objects.all()
    serializer_class = PlanetSerializer
    authentication_classes = [
        authentication.SessionAuthentication,
        CustomTokenAuthentication
    ]
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def get_queryset(self, *args, **kwargs):
        qs = super().get_queryset()
        q = self.request.GET.get('name')

        if q is not None:  # If parameter is exists
            user = None
            if self.request.user.is_authenticated:
                user = self.request.user

            if settings.REDIS_CACHING:  # If caching is enabled
                key_name = f"Planet_{q.replace(' ', '')}"
                value = redis_instance.get(key_name)
                if value:  # Cache exists
                    if settings.DEBUG:
                        print('Serving cache')
                    cache_params = value.decode('utf8').split(' ')
                    return self.queryset.filter(id__in=cache_params).order_by('name')
                else:  # No cache found
                    if settings.DEBUG:
                        print('Serving from database')
                    results = qs.search(q, user=user).order_by('name')
                    limited_results = results[:10]
                    cache_value = ' '.join([str(each_result) for each_result
                                            in limited_results.values_list('id', flat=True)])
                    redis_instance.set(key_name, cache_value, int(settings.REDIS_TTL))
                    return results
            else:  # If caching is disabled
                results = qs.search(q, user=user).order_by('name')
                return results[:10]
        return Planet.objects.none()


# Person View
class PersonListCreateAPIView(generics.ListCreateAPIView):
    queryset = Person.objects.all()
    serializer_class = PersonSerializer
    authentication_classes = [
        authentication.SessionAuthentication,
        CustomTokenAuthentication
    ]
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def perform_create(self, serializer):
        serializer.save()


class PersonDetailAPIView(generics.RetrieveAPIView):
    queryset = Person.objects.all()
    serializer_class = PersonSerializer
    authentication_classes = [
        authentication.SessionAuthentication,
        CustomTokenAuthentication
    ]
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]


class PersonUpdateAPIView(generics.UpdateAPIView):
    queryset = Person.objects.all()
    serializer_class = PersonSerializer
    authentication_classes = [
        authentication.SessionAuthentication,
        CustomTokenAuthentication
    ]
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    lookup_field = 'pk'

    def perform_update(self, serializer):
        serializer.save()


class PersonDestroyAPIView(generics.DestroyAPIView):
    queryset = Person.objects.all()
    serializer_class = PersonSerializer
    authentication_classes = [
        authentication.SessionAuthentication,
        CustomTokenAuthentication
    ]
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    lookup_field = 'pk'

    def perform_destroy(self, instance):
        super().perform_destroy(instance)


class PersonListSearchView(generics.ListAPIView):
    queryset = Person.objects.all()
    serializer_class = PersonSerializer
    authentication_classes = [
        authentication.SessionAuthentication,
        CustomTokenAuthentication
    ]
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def get_queryset(self, *args, **kwargs):
        qs = super().get_queryset()
        q = self.request.GET.get('name')

        if q is not None:  # If parameter is exists
            user = None
            if self.request.user.is_authenticated:
                user = self.request.user

            if settings.REDIS_CACHING:  # If caching is enabled
                key_name = f"Person_{q.replace(' ', '')}"
                value = redis_instance.get(key_name)
                if value:  # Cache exists
                    if settings.DEBUG:
                        print('Serving cache')
                    cache_params = value.decode('utf8').split(' ')
                    return self.queryset.filter(id__in=cache_params).order_by('name')
                else:  # No cache found
                    if settings.DEBUG:
                        print('Serving from database')
                    results = qs.search(q, user=user).order_by('name')
                    limited_results = results[:10]
                    cache_value = ' '.join([str(each_result) for each_result
                                            in limited_results.values_list('id', flat=True)])
                    redis_instance.set(key_name, cache_value, int(settings.REDIS_TTL))
                    return results
            else:  # If caching is disabled
                results = qs.search(q, user=user).order_by('name')
                return results[:10]
        return Person.objects.none()
