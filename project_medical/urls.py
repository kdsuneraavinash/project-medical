from django.urls import include, path
from rest_framework import routers
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    path('markdownx/', include('markdownx.urls')),
]

urlpatterns += [
    path('search/', include('search.urls')),
]
