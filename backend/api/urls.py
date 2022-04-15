from django.urls import path, include

from rest_framework.authtoken.views import obtain_auth_token

from . import views

urlpatterns = [
    path('auth/', obtain_auth_token),
    path('most_piloted', views.MostPilotedStarshipListView.as_view(), name='planets'),

    path('starship/', views.StarshipListCreateAPIView.as_view(), name='starship-list'),
    path('starship/search', views.StarshipListSearchView.as_view(), name='starship-search'),
    path('starship/<int:pk>/', views.StarshipDetailAPIView.as_view(), name='starship-detail'),
    path('starship/<int:pk>/update/', views.StarshipUpdateAPIView.as_view()),
    path('starship/<int:pk>/delete/', views.StarshipDestroyAPIView.as_view()),

    path('planet/', views.PlanetListCreateAPIView.as_view(), name='planet-list'),
    path('planet/search', views.PlanetListSearchView.as_view(), name='planet-search'),
    path('planet/<int:pk>/', views.PlanetDetailAPIView.as_view(), name='planet-detail'),
    path('planet/<int:pk>/update/', views.PlanetUpdateAPIView.as_view()),
    path('planet/<int:pk>/delete/', views.PlanetDestroyAPIView.as_view()),

    path('person/', views.PersonListCreateAPIView.as_view(), name='person-list'),
    path('person/search', views.PersonListSearchView.as_view(), name='person-search'),
    path('person/<int:pk>/', views.PersonDetailAPIView.as_view(), name='person-detail'),
    path('person/<int:pk>/update/', views.PersonUpdateAPIView.as_view()),
    path('person/<int:pk>/delete/', views.PersonDestroyAPIView.as_view()),
]
