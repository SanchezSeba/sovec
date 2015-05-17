# -*- coding: utf-8 -*-
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from models import *
from django.shortcuts import get_object_or_404
from forms import ReservationForm
from django.contrib import messages
from functions import *
from django.core.urlresolvers import reverse
import datetime

@login_required
def seats_selection(request, funcion):
	funcion1 = get_object_or_404(Funcion, idFuncion=funcion)
	if request.method == 'POST':
		user_data = {'funcion':funcion1}
		form = ReservationForm(request.user, request.POST, **user_data)
		if form.is_valid():
			data = form.cleaned_data
			# Reservar
			customer_user = request.user
			if data['for_user']:
				customer_user = data['for_user']
			if data['seat1']:
				# import pdb;pdb.set_trace()
				asiento = Asiento.objects.get(idSala=funcion1.sala,
											 numero=generatePosSeats(data['seat1']))
				Reserva.objects.create(idUsuario_asiste=customer_user,
									   idUsuario_asigna=request.user,
									   idFuncion=funcion1,
									   idAsiento=asiento)
			if data['seat2']:
				asiento = Asiento.objects.get(idSala=funcion1.sala,
											 numero=generatePosSeats(data['seat2']))
				Reserva.objects.create(idUsuario_asiste=customer_user,
									   idUsuario_asigna=request.user,
									   idFuncion=funcion1,
									   idAsiento=asiento)
			if data['seat3']:
				asiento = Asiento.objects.get(idSala=funcion1.sala,
											 numero=generatePosSeats(data['seat3']))
				Reserva.objects.create(idUsuario_asiste=customer_user,
									   idUsuario_asigna=request.user,
									   idFuncion=funcion1,
									   idAsiento=asiento)
			messages.success(request, u'Compra realizada de forma exitosa!')	
			return redirect('/')
	else:
		form = ReservationForm(request.user)

	pelicula_nombre = funcion1.idPelicula.nombre
	reserved_seats = Asiento.objects.filter(reserva__idFuncion=funcion1).values_list('numero')
	sala = funcion1.sala.idSala
	return render(request, 'seat.html',{'seats':generateSeatsPos(reserved_seats),
										'form':form,
										'pelicula':pelicula_nombre,
										'sala':sala,
										'hora_inicio':funcion1.hora_inicio})

@login_required
def remove_tickets(request, funcion):
	funcion1 = get_object_or_404(Funcion, idFuncion=funcion)
	reservas = Reserva.objects.filter(idFuncion=funcion1, idUsuario_asiste=request.user).delete()
	messages.success(request, u'Compra de tickets eliminada')	
	return redirect('profile')


def movie_listing(request):
	template = 'movies.html'
	peliculas = Pelicula.objects.all().order_by('nombre')
	return render(request, template, {'peliculas' : peliculas})

@login_required
def screening(request, pelicula):
	template = 'screening.html'
	pelicula = get_object_or_404(Pelicula, idPelicula = pelicula)
	funciones = Funcion.objects.filter(idPelicula = pelicula).order_by('hora_inicio')
	return render(request, template, {'pelicula':pelicula, 'funciones':funciones})