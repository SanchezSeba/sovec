from django.conf.urls import include, url
from views import seats_selection, remove_tickets, movie_listing, screening, screening_ajax

urlpatterns = [
    url(r'seat/(?P<funcion>\d+)/$', seats_selection, name='seats_selection'),
    url(r'remove_tickets/(?P<funcion>\d+)/$', remove_tickets, name='remove_tickets'),
    url(r'movie_listing/$', movie_listing, name='movie_listing'),
    url(r'screening/(?P<pelicula>\d+)/$', screening, name='screening'),
    url(r'screening/ajax', screening_ajax, name='screening_ajax')
]