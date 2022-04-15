from django.forms.models import model_to_dict
from rest_framework.decorators import api_view
from rest_framework.response import Response


@api_view(['GET'])
def starwars_home(request, *args, **kwargs):
    return Response({"message": "Welcome to Star Wars API!",
                     "documentation": "https://github.com/z3r0k0r3/Star-Wars-API/"}, status=200)
