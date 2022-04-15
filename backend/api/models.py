from django.db import models
from django.db.models import Q


# Starship Model
class StarshipQuerySet(models.QuerySet):
    def search(self, query, user=None):
        lookup = Q(name__icontains=query) | Q(model__icontains=query)
        qs = self.filter(lookup).distinct()
        return qs


class StarshipManager(models.Manager):
    def get_queryset(self, *args, **kwargs):
        return StarshipQuerySet(self.model, using=self._db)

    def search(self, query, user=None):
        return self.get_queryset().search(query, user=user)


class Starship(models.Model):
    name = models.CharField(max_length=128)
    model = models.CharField(max_length=64)
    starship_class = models.CharField(max_length=64)
    manufacturer = models.CharField(max_length=128, null=True)
    cost_in_credits = models.CharField(max_length=255)
    length = models.CharField(max_length=255)
    crew = models.CharField(max_length=255)
    passengers = models.CharField(max_length=255)
    max_atmosphering_speed = models.CharField(max_length=255)
    hyperdrive_rating = models.CharField(max_length=255)

    # The maximum number of Megalights can travel in a standard hour
    # Megalight is a standard distance unit in Star Wars Universe
    MGLT = models.CharField(max_length=255)
    cargo_capacity = models.CharField(max_length=255)

    # The maximum length of time that starship can provide consumables
    # for its entire crew without having to resupply
    consumables = models.CharField(max_length=255)
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)

    objects = StarshipManager()

    def __str__(self):
        return self.name


# Planet Model
class PlanetQuerySet(models.QuerySet):
    def search(self, query, user=None):
        lookup = Q(name__icontains=query)
        qs = self.filter(lookup).distinct()
        return qs


class PlanetManager(models.Manager):
    def get_queryset(self, *args, **kwargs):
        return PlanetQuerySet(self.model, using=self._db)

    def search(self, query, user=None):
        return self.get_queryset().search(query, user=user)


class Planet(models.Model):
    name = models.CharField(max_length=64)
    diameter = models.CharField(max_length=255)
    rotation_period = models.CharField(max_length=255)
    orbital_period = models.CharField(max_length=255)
    gravity = models.CharField(max_length=64)
    population = models.CharField(max_length=255)
    climate = models.CharField(max_length=128)
    terrain = models.CharField(max_length=128)
    surface_water = models.CharField(max_length=64)
    residents = models.ManyToManyField('Person', blank=True)
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)

    objects = PlanetManager()

    def __str__(self):
        return self.name


# Person Model
class PersonQuerySet(models.QuerySet):
    def search(self, query, user=None):
        lookup = Q(name__icontains=query)
        qs = self.filter(lookup).distinct()
        return qs


class PersonManager(models.Manager):
    def get_queryset(self, *args, **kwargs):
        return PersonQuerySet(self.model, using=self._db)

    def search(self, query, user=None):
        return self.get_queryset().search(query, user=user)


class Person(models.Model):
    name = models.CharField(max_length=64)
    birth_year = models.CharField(max_length=7)
    eye_color = models.CharField(max_length=128)
    gender = models.CharField(max_length=16)
    hair_color = models.CharField(max_length=128)
    height = models.CharField(max_length=16)
    mass = models.CharField(max_length=16)
    skin_color = models.CharField(max_length=128)
    homeworld = models.ManyToManyField(Planet, blank=True)
    starships = models.ManyToManyField(Starship, blank=True)
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)

    objects = PersonManager()

    def __str__(self):
        return self.name
