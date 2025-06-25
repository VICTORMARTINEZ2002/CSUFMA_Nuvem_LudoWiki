from django.shortcuts import render
from rest_framework.viewsets import ModelViewSet

from .models import Jogo
from .models import Genero 
from .models import Noticia
from .models import Extensao

from .serializers import JogoSerializer
from .serializers import GeneroSerializer
from .serializers import NoticiaSerializer
from .serializers import ExtensaoSerializer

# Create your views here.
class GeneroViewSet(ModelViewSet):
	queryset = Genero.objects.all()
	serializer_class = GeneroSerializer

class JogoViewSet(ModelViewSet):
	queryset = Jogo.objects.all()
	serializer_class = JogoSerializer

class ExtensaoViewSet(ModelViewSet):
	queryset = Extensao.objects.all()
	serializer_class = ExtensaoSerializer

class NoticiaViewSet(ModelViewSet):
	queryset = Noticia.objects.all()
	serializer_class = NoticiaSerializer
