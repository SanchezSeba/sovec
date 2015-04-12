from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import render_to_response

def home(request):
	if request.user.is_authenticated():
		return render_to_response('home.html',{'auth':True})
	else:
		return render_to_response('home.html',{'auth':False})

