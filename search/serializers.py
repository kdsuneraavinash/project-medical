from django.contrib.auth.models import User, Group
from search.models import *
from rest_framework import serializers


# Base Objects

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


class SymptomSerializer(serializers.ModelSerializer):
    class Meta:
        fields = '__all__'
        model = Symptom


# Search results


class DiseaseResultSerializer(serializers.ModelSerializer):
    snippet = serializers.SerializerMethodField('get_snippet')

    def get_snippet(self, obj):
        return obj.snippet()

    class Meta:
        exclude = ('description',)
        model = Disease


class MedicineResultSerializer(serializers.ModelSerializer):
    snippet = serializers.SerializerMethodField('get_snippet')

    def get_snippet(self, obj):
        return obj.snippet()

    class Meta:
        exclude = ('description',)
        model = Medicine


class PharmacyResultSerializer(serializers.ModelSerializer):
    snippet = serializers.SerializerMethodField('get_snippet')

    def get_snippet(self, obj):
        return obj.snippet()

    class Meta:
        exclude = ('description', 'langitude', 'longitude', )
        model = Pharmacy


class SymptomResultSerializer(serializers.ModelSerializer):
    class Meta:
        exclude = ('timestamp',)
        model = Symptom
