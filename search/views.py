from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from search.serializers import *
from search.models import *
from rest_framework import generics, filters


class DiseaseList(generics.ListAPIView):
    search_fields = ['name', 'description']
    filter_backends = (filters.SearchFilter,)
    queryset = Disease.objects.all()
    serializer_class = DiseaseResultSerializer


class MedicineList(generics.ListAPIView):
    search_fields = ['name', 'description']
    filter_backends = (filters.SearchFilter,)
    queryset = Medicine.objects.all()
    serializer_class = MedicineResultSerializer


class PharmacyList(generics.ListAPIView):
    search_fields = ['name', 'description']
    filter_backends = (filters.SearchFilter,)
    queryset = Pharmacy.objects.all()
    serializer_class = PharmacyResultSerializer


class SymptomList(generics.ListAPIView):
    search_fields = ['name']
    filter_backends = (filters.SearchFilter,)
    queryset = Symptom.objects.all()
    serializer_class = SymptomResultSerializer
