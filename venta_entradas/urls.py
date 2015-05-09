from django.conf.urls import include, url
from views import seats_selection

urlpatterns = [
    url(r'seat/(?P<funcion>\d+)/$', seats_selection, name='seats_selection'),
]