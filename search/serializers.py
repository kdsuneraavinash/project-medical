from django.contrib.auth.models import User, Group
from search.models import *
from rest_framework import serializers


class PharmacySerializer(serializers.ModelSerializer):
    class Meta:
        fields = '__all__'
        model = Pharmacy


class MedicineSerializer(serializers.ModelSerializer):
    class Meta:
        fields = '__all__'
        model = Medicine


class DiseaseSerializer(serializers.ModelSerializer):
    class Meta:
        fields = '__all__'
        model = Disease


class SoldAtSerializer(serializers.ModelSerializer):
    class Meta:
        fields = '__all__'
        model = SoldAt


class TreatmentSerializer(serializers.ModelSerializer):
    class Meta:
        fields = '__all__'
        model = Treatment
