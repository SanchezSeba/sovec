from django.conf.urls import include, url
from views import seats_selection

urlpatterns = [
    url(r'seat/$', seats_selection, name='seats_selection'),
]