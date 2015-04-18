from django.conf.urls import include, url
from django.contrib import admin
from venta_entradas.views import home, login_user, register_user

urlpatterns = [
    # Examples:
    # url(r'^$', 'sovec.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^$', home, name='home'),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^logout/$', 'django.contrib.auth.views.logout',
                          {'next_page': '/'}, name ='logout'),
    url(r'^login/$', login_user, name='login_user'),
    url(r'^register/$', register_user, name='register_user'),
]
