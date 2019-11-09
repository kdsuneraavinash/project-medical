from django.urls import include, path
from rest_framework import routers
from search import views
from django.contrib import admin

urlpatterns = [
    path('disease/', views.DiseaseList.as_view()),
    path('medicine/', views.MedicineList.as_view()),
    path('symptom/', views.SymptomList.as_view()),
    path('pharmacy/', views.PharmacyList.as_view()),

    path('disease/<uuid:pk>/', views.DiseaseView.as_view()),
    path('medicine/<uuid:pk>/', views.MedicineView.as_view()),
    path('symptom/<uuid:pk>/', views.SymptomView.as_view()),
    path('pharmacy/<uuid:pk>/', views.PharmacyView.as_view()),

    path('treatment/', views.TreatmentView.as_view()),
    path('suggest/', views.SuggestView.as_view()),
    path('sell/', views.SellView.as_view()),
]
