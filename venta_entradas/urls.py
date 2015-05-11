from django.conf.urls import include, url
from views import seats_selection, remove_tickets

urlpatterns = [
    url(r'seat/(?P<funcion>\d+)/$', seats_selection, name='seats_selection'),
    url(r'remove_tickets/(?P<funcion>\d+)/$', remove_tickets, name='remove_tickets'),
]