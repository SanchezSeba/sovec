from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import render_to_response

def hello(request):
    return render_to_response('index.html')
# Create your views here.
