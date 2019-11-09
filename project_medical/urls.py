from django.urls import include, path
from rest_framework import routers
from django.contrib import admin
from django.views.generic.base import TemplateView

urlpatterns = [
    path('', TemplateView.as_view(template_name='index.html')),
    path('admin/', admin.site.urls),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    path('markdownx/', include('markdownx.urls')),
]

urlpatterns += [
    path('api/', include('search.urls')),
]
