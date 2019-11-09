from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from search.serializers import *
from search.models import *
from rest_framework import generics, filters
from rest_framework.response import Response
from rest_framework.exceptions import APIException
import uuid


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
        disease = self.request.query_params.get('id', None)
        try:
            disease = uuid.UUID(disease, version=4)
        except:
            raise APIException("Invalid uuid")
        queryset = Medicine.objects.filter(treatment__disease=disease)
        return queryset


class SuggestView(generics.ListAPIView):
    serializer_class = SymptomResultSerializer

    def get_queryset(self):
        disease = self.request.query_params.get('id', None)
        try:
            disease = uuid.UUID(disease, version=4)
        except:
            raise APIException("Invalid uuid")
        queryset = Symptom.objects.filter(suggest__disease=disease)
        return queryset


class SellView(generics.ListAPIView):
    serializer_class = PharmacyResultSerializer

    def get_queryset(self):
        medicine = self.request.query_params.get('id', None)
        try:
            medicine = uuid.UUID(medicine, version=4)
        except:
            raise APIException("Invalid uuid")
        queryset = Pharmacy.objects.filter(sell__medicine=medicine)
        return queryset
