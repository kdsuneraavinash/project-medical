from django.urls import include, path
from rest_framework import routers
from search import views
from django.contrib import admin


urlpatterns = [
    path('disease/', views.DiseaseList.as_view()),
    path('medicine/', views.MedicineList.as_view()),
    path('symptom/', views.SymptomList.as_view()),
    path('pharmacy/', views.PharmacyList.as_view()),
]
