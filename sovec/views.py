# -*- coding: utf-8 -*-
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.shortcuts import render_to_response
from django.contrib.auth import authenticate, login
from django.contrib import messages
from forms import UserForm
import json
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from venta_entradas.models import Pelicula, Reserva
from datetime import datetime  
from django.contrib.auth.forms import AdminPasswordChangeForm

def home(request):
	if request.user.is_authenticated():
		return render(request,'home.html', content_type="text/html")
	else:
		return render(request, 'home.html', content_type="text/html")

def login_user(request):
	if request.method == 'POST':
		login_username = request.POST['login_username']
		login_password = request.POST['login_password']

		user = authenticate(username=login_username, password=login_password)

		if user:
			login(request, user)
			messages.success(request, u'¡Bienvenido %s!' % (login_username))
			return redirect('/')
		else:
			messages.error(request, 'Error al ingresar Usuario o Contraseña')
			return render(request, "home.html", content_type="text/html")
	else:
		return render(request, 'home.html', content_type="text/html")

def register_user(request):
	if request.method == 'POST':
		form = UserForm(request.POST)
		if form.is_valid():
			data = form.cleaned_data
			user = User.objects.create_user(data['register_username'],
											data['register_email'],
											data['register_password'])
			user.first_name = data['register_name']
			user.last_name = data['register_last_name']
			user.save()
			# import pdb;
			# pdb.set_trace()
			user = authenticate(username=data['register_username'],
								password=data['register_password'])
			login(request, user)
			messages.success(request, 'Registrado correctamente')
			return HttpResponse(json.dumps({'success':True}), content_type='application/json')
		else:
			fields = []
			for field in form.fields:
				fields.append(field)
			data = {'success':False, 'errors':form.errors, 'fields':fields}
			return HttpResponse(json.dumps(data), content_type='application/json')
	else:
		return render(request, 'home.html', content_type="text/html")

@login_required
def profile(request):
	peliculas = Pelicula.objects.filter(funcion__reserva__idUsuario_asiste=request.user).distinct()
	reservas = Reserva.objects.filter(idUsuario_asiste=request.user,									  
									  idFuncion__hora_inicio__gt=datetime.now()).order_by('idFuncion__idPelicula')
	return render(request, 'profile.html', {'reservas':reservas}, content_type="text/html")

@login_required
def change_password(request):
	if request.method == 'POST':
		form = AdminPasswordChangeForm(request.user, request.POST)
		if form.is_valid():
			form.save()
			messages.success(request, 'Contraseña modificada exitosamente')
			return redirect('/')	
	else:
		form = AdminPasswordChangeForm(request.user)
	return render(request, 'change_password.html', {'form':form}, content_type="text/html")