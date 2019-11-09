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


class DiseaseList(generics.ListAPIView):
    queryset = Disease.objects.all()
    serializer_class = DiseaseSerializer


class SoldAtList(generics.ListAPIView):
    queryset = SoldAt.objects.all()
    serializer_class = SoldAtSerializer


class TreatmentList(generics.ListAPIView):
    queryset = Treatment.objects.all()
    serializer_class = TreatmentSerializer
