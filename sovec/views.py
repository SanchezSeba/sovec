# -*- coding: utf-8 -*-
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.shortcuts import render_to_response
from django.contrib.auth import authenticate, login
from django.contrib import messages
from forms import UserForm
import json
from django.contrib.auth.models import User


def home(request):
	if request.user.is_authenticated():
		return render(request,'home.html')
	else:
		# form = UserForm
		return render(request, 'home.html')
		# return render_to_response('home.html',{'auth':False})

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
			return render(request, "home.html")
	else:
		return render(request, 'home.html')

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
		return render(request, 'home.html')