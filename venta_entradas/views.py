# -*- coding: utf-8 -*-
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from models import *
from django.shortcuts import get_object_or_404

@login_required
def seats_selection(request, funcion):
	if request.method == 'POST':
		return render(request, 'seat.html')
	else:
		funcion = get_object_or_404(Funcion, idFuncion=funcion)
		reserved_seats = Asiento.objects.filter(reserva__idFuncion=funcion).values_list('numero')
		return render(request, 'seat.html',{'asientos':seats[reserved_seats[0][0]]})


# Math entre numero de asiento y ubicacion
seats = {}
for i in range(1,13):
	seats[i] = str(1) + '_' + str(i + 2)
for i in range(13,25):
	seats[i] = str(2) + '_' + str(i - 10)
for i in range(0,7):
	for j in range(25+12*i,28+12*i):
		seats[j] = str(4+i) + '_' + str(j - (24 + 12*i))
	for j in range(28+12*i,34+12*i):
		seats[j] = str(4+i) + '_' + str(j - (22 + 12*i))
	for j in range(34+12*i,37+12*i):
		seats[j] = str(4+i) + '_' + str(j - (20 + 12*i))