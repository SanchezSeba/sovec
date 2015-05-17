from django.db import models
from django.contrib.auth.models import User

class Pelicula(models.Model):
	idPelicula = models.AutoField(primary_key=True)
	nombre = models.CharField(max_length=100)
	descripcion = models.CharField(max_length=1000)
	duracion = models.DurationField()
	poster = models.CharField(max_length=1000)

	def __unicode__(self):
		return unicode(self.__str__())

	def __str__(self): 
		return  self.nombre

class Sala(models.Model):
	idSala = models.AutoField(primary_key=True)
	numero = models.IntegerField(unique=True)

	def __unicode__(self):
		return unicode(self.__str__())

	def __str__(self): 
		return  "Sala %d" % (self.numero)

class Asiento(models.Model):
	idAsiento = models.AutoField(primary_key=True)
	idSala = models.ForeignKey(Sala)
	numero = models.IntegerField()

	class Meta:
		unique_together = ("idSala", "numero")

class Funcion(models.Model):
	idFuncion = models.AutoField(primary_key=True)
	idPelicula = models.ForeignKey(Pelicula)
	sala = models.ForeignKey(Sala)
	hora_inicio = models.DateTimeField()

	def __unicode__(self):
		return unicode(self.__str__())

	def __str__(self): 
		return  "%s, sala %d, inicio: %s" % (self.idPelicula.nombre,
											 self.sala.numero,
											 self.hora_inicio.strftime("%d-%m-%Y, %H:%M"))

class Reserva(models.Model):
	idReserva = models.AutoField(primary_key=True)
	idUsuario_asiste = models.ForeignKey(User, related_name="reserva_asiste")
	idUsuario_asigna = models.ForeignKey(User, related_name="reserva_asigna")
	idFuncion = models.ForeignKey(Funcion)
	idAsiento = models.ForeignKey(Asiento)

	class Meta:
		unique_together = ("idFuncion", "idAsiento")