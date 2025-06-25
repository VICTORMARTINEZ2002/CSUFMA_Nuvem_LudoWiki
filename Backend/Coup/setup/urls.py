from django.urls import path, include
from rest_framework.routers import DefaultRouter

from .views import JogoViewSet
from .views import GeneroViewSet
from .views import NoticiaViewSet
from .views import ExtensaoViewSet

router = DefaultRouter()
router.register(r'jogos',    JogoViewSet)
router.register(r'generos',  GeneroViewSet)
router.register(r'noticias', NoticiaViewSet)
router.register(r'extensoes',ExtensaoViewSet)


urlpatterns = [
	path('', include(router.urls)),
]
