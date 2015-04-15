# -*- coding: utf-8 -*-
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.shortcuts import render_to_response
from django.contrib.auth import authenticate, login
from django.contrib import messages

def home(request):
	if request.user.is_authenticated():
		return render(request,'home.html')
	else:
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