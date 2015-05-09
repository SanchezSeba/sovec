from django.contrib import admin
from models import Pelicula, Funcion, Sala, Asiento, Reserva
# Register your models here.

@admin.register(Pelicula)
class PeliculaAdmin(admin.ModelAdmin):
	pass

@admin.register(Funcion)
class FuncionAdmin(admin.ModelAdmin):
	pass

@admin.register(Asiento)
class AsientoAdmin(admin.ModelAdmin):
	pass

@admin.register(Sala)
class SalaAdmin(admin.ModelAdmin):
	pass

@admin.register(Reserva)
class ReservaAdmin(admin.ModelAdmin):
	pass