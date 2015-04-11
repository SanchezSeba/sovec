from django.conf.urls import include, url
from django.contrib import admin
from venta_entradas.views import hello

urlpatterns = [
    # Examples:
    # url(r'^$', 'sovec.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^hello/$', hello),
    url(r'^admin/', include(admin.site.urls)),
]
