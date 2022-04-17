from rest_framework import authentication, generics, permissions

from statistics import multimode

from .authentication import CustomTokenAuthentication
from .models import Starship, Planet, Person
from .serializers import StarshipSerializer, PlanetSerializer, PersonSerializer


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
        planets_params = self.request.query_params.get('planet').replace(' ', '').split(',')  # Getting list parameters
        planet_qs = self.planet_queryset.filter(name__in=planets_params)  # Filter all planet with received params
        resident_params = planet_qs.values_list('residents', flat=True)  # Get residents' ID from filtered planets
        resident_qs = self.resident_queryset.filter(id__in=resident_params)  # Exclude all residents except parameters
        starship_list = resident_qs.values_list('starships', flat=True)  # Get starships from filtered residents
        # Some resident does not have their own starship, So, None type exists
        # Convert Starship ID from the filtered starships_list to Integer List using List Comprehension
        starships = [int(starship_list[i]) for i in range(len(starship_list)) if starship_list[i] is not None]
        # Make use of Multimode from Statistics Package to find maximum occurrence or multiple mode if exists
        starship_params = multimode(starships)
        # After getting Starship ID that have the most occurrence or is the most piloted ship(s)
        # Filter it from all the starship. So, only the most piloted starship(s) is/are returned
        starships_qs = self.starship_queryset.filter(id__in=starship_params)
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
        results = Starship.objects.none()
        if q is not None:
            user = None
            if self.request.user.is_authenticated:
                user = self.request.user
            results = qs.search(q, user=user)
        return results


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
        results = Starship.objects.none()
        if q is not None:
            user = None
            if self.request.user.is_authenticated:
                user = self.request.user
            results = qs.search(q, user=user)
        return results


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
        results = Starship.objects.none()
        if q is not None:
            user = None
            if self.request.user.is_authenticated:
                user = self.request.user
            results = qs.search(q, user=user)
        return results
