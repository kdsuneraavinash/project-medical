from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from search.serializers import *
from search.models import *
from rest_framework import generics


class PharmacyList(generics.ListAPIView):
    queryset = Pharmacy.objects.all()
    serializer_class = PharmacySerializer


class MedicineList(generics.ListAPIView):
    queryset = Medicine.objects.all()
    serializer_class = MedicineSerializer


class PharmacyMedicineList(generics.ListAPIView):
    queryset = PharmacyMedicine.objects.all()
    serializer_class = PharmacyMedicineSerializer


class DiseaseList(generics.ListAPIView):
    queryset = Disease.objects.all()
    serializer_class = DiseaseSerializer


class MedicineDiseaseList(generics.ListAPIView):
    queryset = MedicineDisease.objects.all()
    serializer_class = MedicineDiseaseSerializer
