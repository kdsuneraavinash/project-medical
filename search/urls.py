from django.urls import include, path
from rest_framework import routers
from search import views
from django.contrib import admin


urlpatterns = [
    path('all/pharmacy/', views.PharmacyList.as_view()),
    path('all/medicine/', views.MedicineList.as_view()),
    path('all/treatment/', views.TreatmentList.as_view()),
]
