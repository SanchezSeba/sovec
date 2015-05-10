# -*- coding: utf-8 -*-
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from models import *
from django.shortcuts import get_object_or_404
from forms import ReservationForm
from django.contrib import messages
from functions import *

@login_required
def seats_selection(request, funcion):
	funcion1 = get_object_or_404(Funcion, idFuncion=funcion)
	user = {'user': request.user, 'funcion':funcion1}
	if request.method == 'POST':
		form = ReservationForm(request.POST, **user)
		if form.is_valid():
			data = form.cleaned_data
			# Reservar
			if data['seat1']:
				# import pdb;pdb.set_trace()
				asiento = Asiento.objects.get(idSala=funcion1.sala,
											 numero=generatePosSeats(data['seat1']))
				Reserva.objects.create(idUsuario_asiste=request.user,
									   idUsuario_asigna=request.user,
									   idFuncion=funcion1,
									   idAsiento=asiento)
			if data['seat2']:
				asiento = Asiento.objects.get(idSala=funcion1.sala,
											 numero=generatePosSeats(data['seat2']))
				Reserva.objects.create(idUsuario_asiste=request.user,
									   idUsuario_asigna=request.user,
									   idFuncion=funcion1,
									   idAsiento=asiento)
			if data['seat3']:
				asiento = Asiento.objects.get(idSala=funcion1.sala,
											 numero=generatePosSeats(data['seat3']))
				Reserva.objects.create(idUsuario_asiste=request.user,
									   idUsuario_asigna=request.user,
									   idFuncion=funcion1,
									   idAsiento=asiento)
			messages.success(request, u'Compra realizada de forma exitosa!')	
			return redirect('/')
	else:
		form = ReservationForm()
	reserved_seats = Asiento.objects.filter(reserva__idFuncion=funcion1).values_list('numero')
	return render(request, 'seat.html',{'seats':generateSeatsPos(reserved_seats), 'form':form})
