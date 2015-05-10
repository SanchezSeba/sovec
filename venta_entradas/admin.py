from django.contrib import admin
from models import Pelicula, Funcion, Sala, Asiento, Reserva
# Register your models here.
from django.contrib.admin.widgets import AdminTimeWidget
from django.db import models
from django import forms


@admin.register(Pelicula)
class PeliculaAdmin(admin.ModelAdmin):
	pass

@admin.register(Funcion)
class FuncionAdmin(admin.ModelAdmin):
	pass

@admin.register(Sala)
class SalaAdmin(admin.ModelAdmin):

	def save_model(self, request, obj, form, change):
		obj.save()
		for i in range(1,109):
			Asiento.objects.create(numero=i,idSala=obj)

	def delete_model(self, request, obj):
		for i in range(1,109):
			Asiento.objects.get(numero=i,idSala=obj).delete()
		obj.delete()