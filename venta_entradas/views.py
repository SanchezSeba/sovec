# -*- coding: utf-8 -*-
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from models import *
from django.shortcuts import get_object_or_404
from forms import ReservationForm
from django.contrib import messages
from functions import *
from django.core.urlresolvers import reverse
from datetime import datetime, timedelta, time
from django.http import HttpResponse
from django.core import serializers

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

	'''
	filtro para las películas por día
	por defecto se listan las de now().date()
	'''
	today = datetime.now().date()
	tomorrow = today + timedelta(1)
	today_start = datetime.combine(today, time())
	today_end = datetime.combine(tomorrow, time())

	funciones = Funcion.objects.filter(idPelicula = pelicula,
										hora_inicio__lte=today_end,
										hora_inicio__gte=today_start).order_by('hora_inicio')
	return render(request, template, {'pelicula':pelicula, 'funciones':funciones})

@login_required
def screening_ajax(request):
	date = request.POST['fecha'].split("T")[0]
	movie = request.POST['pelicula']

	current_date = datetime.strptime(date, '%Y-%m-%d')
	next_date = current_date + timedelta(1)
	current_start = datetime.combine(current_date, time())
	current_end = datetime.combine(next_date, time())

	funciones = Funcion.objects.filter(idPelicula = movie,
										hora_inicio__lte=current_end,
										hora_inicio__gte=current_start).order_by('hora_inicio')

	table_data = serializers.serialize("json", funciones)
	return HttpResponse(table_data, content_type="application/json")