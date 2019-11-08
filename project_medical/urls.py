from django.urls import include, path
from rest_framework import routers
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework'))
]

urlpatterns += [
    path('search/', include('search.urls')),
]
