from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from search.serializers import *
from search.models import *
from rest_framework import generics, filters
from rest_framework.response import Response

# Lists


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

# Views


class DiseaseView(generics.RetrieveAPIView):
    queryset = Disease.objects.all()
    serializer_class = DiseaseSerializer


class MedicineView(generics.RetrieveAPIView):
    queryset = Medicine.objects.all()
    serializer_class = MedicineSerializer


class PharmacyView(generics.RetrieveAPIView):
    queryset = Pharmacy.objects.all()
    serializer_class = PharmacySerializer


class SymptomView(generics.RetrieveAPIView):
    queryset = Symptom.objects.all()
    serializer_class = SymptomSerializer

# Retrievers


class TreatmentView(generics.ListAPIView):
    serializer_class = MedicineResultSerializer

    def get_queryset(self):
        disease = self.request.query_params.get('disease', None)
        return Medicine.objects.filter(treatment__disease=disease)


class SuggestView(generics.ListAPIView):
    serializer_class = SymptomResultSerializer

    def get_queryset(self):
        disease = self.request.query_params.get('disease', None)
        return Symptom.objects.filter(suggest__disease=disease)


class SellView(generics.ListAPIView):
    serializer_class = PharmacyResultSerializer

    def get_queryset(self):
        medicine = self.request.query_params.get('medicine', None)
        return Pharmacy.objects.filter(sell__medicine=medicine)
