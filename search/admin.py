from django.contrib import admin
from search.models import *


@admin.register(Pharmacy)
class PharmacyAdmin(admin.ModelAdmin):
    list_display = ('name', 'description',
                    'address', 'phone_number', 'display_image')


@admin.register(Medicine)
class MedicineAdmin(admin.ModelAdmin):
    list_display = ('name', 'description', 'display_image')


@admin.register(Disease)
class DiseaseAdmin(admin.ModelAdmin):
    list_display = ('name', 'description', 'display_image')


@admin.register(PharmacyMedicine)
class PharmacyMedicineAdmin(admin.ModelAdmin):
    list_display = ('pharmacy', 'medicine')


@admin.register(MedicineDisease)
class MedicineDiseaseAdmin(admin.ModelAdmin):
    list_display = ('medicine', 'disease')
