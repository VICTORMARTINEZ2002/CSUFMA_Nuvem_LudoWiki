from rest_framework import serializers

from .models import Jogo
from .models import Genero 
from .models import Noticia
from .models import Extensao

class GeneroSerializer(serializers.ModelSerializer):
	class Meta:
		model = Genero
		fields = '__all__'

class JogoSerializer(serializers.ModelSerializer):
	class Meta:
		model = Jogo
		fields = '__all__'

class ExtensaoSerializer(serializers.ModelSerializer):
	class Meta:
		model = Extensao
		fields = '__all__'

class NoticiaSerializer(serializers.ModelSerializer):
	class Meta:
		model = Noticia
		fields = '__all__'
