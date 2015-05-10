# -*- coding: utf-8 -*-
from django import forms
from models import Asiento, Funcion, Reserva
from django.forms import ValidationError
from functions import *
from django.contrib.auth.models import User

class ReservationForm(forms.Form):
	seat1 = forms.CharField(max_length=5, min_length=3,
		widget=forms.HiddenInput(), required=False)
	seat2 = forms.CharField(max_length=5, min_length=3,
		widget=forms.HiddenInput(), required=False)
	seat3 = forms.CharField(max_length=5, min_length=3,
		widget=forms.HiddenInput(), required=False)
	for_user = forms.ModelChoiceField(queryset=None, 
									  required=False,
									  widget=forms.HiddenInput(),
									  label='Cliente')

	def __init__(self, user, *args, **kwargs):
		self.funcion = kwargs.pop('funcion', None)
		self.user = user
		# import pdb; pdb.set_trace()
		super(ReservationForm, self).__init__(*args, **kwargs)
		if user.is_superuser:
			self.fields['for_user'].widget = forms.Select()
			self.fields['for_user'].required = True
			self.fields['for_user'].queryset = User.objects.all()
		else:
			self.fields['for_user'].queryset = User.objects.none()

	def clean(self):
		super(forms.Form,self).clean()
		# Verificar si ha comprado el maximo de entradas
		actual_tickets = 0
		if self.user.is_superuser:
			actual_tickets = Reserva.objects.filter(idFuncion=self.funcion,
													idUsuario_asiste=self.cleaned_data.get('for_user')).count()
		else:
			actual_tickets = Reserva.objects.filter(idFuncion=self.funcion,
													idUsuario_asiste=self.user).count()
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