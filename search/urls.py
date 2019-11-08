from django.urls import include, path
from rest_framework import routers
from search import views
from django.contrib import admin


urlpatterns = [
    path('pharmacy/', views.PharmacyList.as_view()),
    path('medicine/', views.MedicineList.as_view()),
    path('pharmacy-medicine/', views.PharmacyMedicineList.as_view()),
]
