# -*- coding: utf-8 -*-
from django import forms
from models import Asiento, Funcion, Reserva
from django.forms import ValidationError
from functions import *

class ReservationForm(forms.Form):
	seat1 = forms.CharField(max_length=5, min_length=3,
		widget=forms.HiddenInput(), required=False)
	seat2 = forms.CharField(max_length=5, min_length=3,
		widget=forms.HiddenInput(), required=False)
	seat3 = forms.CharField(max_length=5, min_length=3,
		widget=forms.HiddenInput(), required=False)

	def __init__(self, *args, **kwargs):
		self.user = kwargs.pop('user', None)
		self.funcion = kwargs.pop('funcion', None)
		super(ReservationForm, self).__init__(*args, **kwargs)

	def clean(self):
		super(forms.Form,self).clean()
		# Verificar si ha comprado el maximo de entradas
		# import pdb; pdb.set_trace()
		actual_tickets = Reserva.objects.filter(idFuncion=self.funcion, idUsuario_asiste=self.user).count()
		if actual_tickets>=3:
			raise ValidationError('Ya ha comprado el maximo de entradas')

		# Contamos la cantidad de nuevas compras
		i = 0
		# Verificae si ya existe alguna reserva con los asientos seleccionados
		if self.cleaned_data.get('seat1'):
			if Reserva.objects.filter(idFuncion=self.funcion,
								  idAsiento__numero=generatePosSeats(self.cleaned_data['seat1'])).exists():
				raise ValidationError('Debe elegir asientos no vendidos')
			i+=1
		if self.cleaned_data.get('seat2'):
			if Reserva.objects.filter(idFuncion=self.funcion,
								  idAsiento__numero=generatePosSeats(self.cleaned_data['seat2'])).exists():
				raise ValidationError('Debe elegir asientos no vendidos')
			i+=1
		if self.cleaned_data.get('seat3'):
			if Reserva.objects.filter(idFuncion=self.funcion,
								  idAsiento__numero=generatePosSeats(self.cleaned_data['seat3'])).exists():
				raise ValidationError('Debe elegir asientos no vendidos')
			i+=1
		if i + actual_tickets > 3:
			raise ValidationError('Ya ha comprado el maximo de entradas')
		return self.cleaned_data