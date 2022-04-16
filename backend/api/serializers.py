from abc import ABC

from rest_framework import serializers

from .models import Starship, Planet, Person


# Hyperlink
class StarshipHyperlinkSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(view_name='starship-detail', lookup_field='pk')

    class Meta:
        model = Starship
        fields = [
            'name', 'url'
        ]


class PersonHyperlinkSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(view_name='person-detail', lookup_field='pk')

    class Meta:
        model = Person
        fields = [
            'name', 'url',
        ]


class PlanetHyperlinkSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(view_name='planet-detail', lookup_field='pk')

    class Meta:
        model = Planet
        fields = [
            'name', 'url'
        ]


class StarshipSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(view_name='starship-detail', lookup_field='pk')

    class Meta:
        model = Starship
        fields = [
            'name', 'model', 'starship_class', 'manufacturer', 'cost_in_credits',
            'length', 'crew', 'passengers', 'max_atmosphering_speed', 'hyperdrive_rating',
            'MGLT', 'cargo_capacity', 'consumables', 'url', 'created', 'modified'
        ]


class PlanetSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(view_name='planet-detail', lookup_field='pk')
    residents = PersonHyperlinkSerializer(many=True)

    class Meta:
        model = Planet
        fields = [
            'name', 'diameter', 'rotation_period', 'orbital_period',
            'gravity', 'population', 'climate', 'terrain',
            'surface_water', 'residents', 'url', 'created', 'modified'
        ]


class PersonSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(view_name='person-detail', lookup_field='pk')
    homeworld = PlanetHyperlinkSerializer(many=True)
    starships = StarshipHyperlinkSerializer(many=True)

    class Meta:
        model = Person
        fields = [
            'name', 'birth_year', 'eye_color', 'gender',
            'hair_color', 'height', 'mass', 'skin_color', 'homeworld',
            'starships', 'url', 'created', 'modified'
        ]
