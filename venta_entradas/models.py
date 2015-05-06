from django.db import models
from django.contrib.auth.models import User

class Pelicula(models.Model):
	idPelicula = models.AutoField(primary_key=True)
	nombre = models.CharField(max_length=100)
	descripcion = models.CharField(max_length=1000)
	duracion = models.DateTimeField()

class Sala(models.Model):
	idSala = models.AutoField(primary_key=True)
	numero = models.IntegerField()

class Asiento(models.Model):
	idAsiento = models.AutoField(primary_key=True)
	idSala = models.ForeignKey(Sala)
	numero = models.IntegerField()

class Funcion(models.Model):
	idFuncion = models.AutoField(primary_key=True)
	idPelicula = models.ForeignKey(Pelicula)
	idAsiento = models.ForeignKey(Asiento)
	hora_inicio = models.DateTimeField()

class Reserva(models.Model):
	idReserva = models.AutoField(primary_key=True)
	idUsuario_asiste = models.ForeignKey(User, related_name="reserva_asiste")
	idUsuario_asigna = models.ForeignKey(User, related_name="reserva_asigna")
	idFuncion = models.ForeignKey(Funcion)
	idAsiento = models.ForeignKey(Asiento)
