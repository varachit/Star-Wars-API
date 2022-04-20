from algoliasearch_django import AlgoliaIndex
from algoliasearch_django.decorators import register

from .models import Starship, Planet, Person


# Algolia Model Register
@register(Starship)
class StarshipIndex(AlgoliaIndex):
    fields = (
        'name', 'model', 'starship_class', 'manufacturer', 'cost_in_credits',
        'length', 'crew', 'passengers', 'max_atmosphering_speed',
        'hyperdrive_rating', 'MGLT', 'cargo_capacity', 'consumables'
    )
    settings = {
        'searchableAttributes': ['name', 'model', 'starship_class']
    }


@register(Planet)
class PlanetIndex(AlgoliaIndex):
    fields = (
        'name', 'diameter', 'rotation_period', 'orbital_period',
        'gravity', 'population', 'climate', 'terrain', 'surface_water'
    )
    settings = {
        'searchableAttributes': ['name', 'climate', 'terrain']
    }


@register(Person)
class PersonIndex(AlgoliaIndex):
    fields = (
        'name', 'birth_year', 'eye_color', 'gender', 'hair_color',
        'height', 'mass', 'skin_color'
    )
    settings = {
        'searchableAttributes': ['name', 'birth_year', 'eye_color', 'gender', 'hair_color', 'skin_color']
    }
