from django.contrib import admin

from .models import Starship, Planet, Person

# Register your models here.
admin.site.register(Starship)
admin.site.register(Planet)
admin.site.register(Person)
