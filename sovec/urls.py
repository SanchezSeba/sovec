from django.conf.urls import include, url
from django.contrib import admin
from views import home, login_user, register_user, profile, change_password

urlpatterns = [
    # Examples:
    # url(r'^$', 'sovec.views.home', name='home'),
    url(r'^$', home, name='home'),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^logout/$', 'django.contrib.auth.views.logout',
                          {'next_page': '/'}, name ='logout'),
    url(r'^password_change/$', change_password, name="password_change"),
    url(r'^login/$', login_user, name='login_user'),
    url(r'^register/$', register_user, name='register_user'),
    url(r'^profile/$', profile, name='profile'),
    url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': 'media'}),
    url(r'^', include('venta_entradas.urls')),
]
