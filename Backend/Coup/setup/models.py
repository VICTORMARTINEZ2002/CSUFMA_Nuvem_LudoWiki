from django.db import models

# Create your models here.
class Genero(models.Model):
	nome = models.CharField(max_length=100)

	class Meta: db_table = 'genero'	

class Jogo(models.Model):
	nome        = models.CharField(max_length=100)
	descricao   = models.TextField()
	img         = models.TextField()
	max_players = models.IntegerField()
	duracao     = models.TimeField()
	ano         = models.IntegerField()
	genero      = models.ForeignKey(Genero, on_delete = models.CASCADE)
	manual      = models.TextField(null=True, blank=True)

	class Meta: db_table = 'jogo'	

class Extensao(models.Model):
	nome      = models.CharField(max_length=100)
	jogo_base = models.ForeignKey(Jogo, on_delete = models.CASCADE)
	descricao = models.TextField()
	img       = models.TextField()
	manual    = models.TextField(null=True, blank=True)
	ano       = models.IntegerField()

	class Meta: db_table = 'extensao'	

class Noticia(models.Model):
	jogo  = models.ForeignKey(Jogo, on_delete = models.CASCADE)
	title = models.CharField(max_length=200)
	body  = models.TextField()

	class Meta: db_table = 'noticia'	