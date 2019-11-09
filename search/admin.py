from django.contrib import admin
from markdownx.admin import MarkdownxModelAdmin
from search.models import *


class SellInline(admin.TabularInline):
    model = Sell


class TreatmentInline(admin.TabularInline):
    model = Treatment


class SuggestInline(admin.TabularInline):
    model = Suggest


@admin.register(Pharmacy)
class PharmacyAdmin(MarkdownxModelAdmin):
    list_display = ('name', 'description',
                    'address', 'phone_number', 'display_image')
    inlines = [SellInline]


@admin.register(Medicine)
class MedicineAdmin(MarkdownxModelAdmin):
    list_display = ('name', 'description', 'display_image')
    inlines = [TreatmentInline, SellInline]


@admin.register(Disease)
class DiseaseAdmin(MarkdownxModelAdmin):
    list_display = ('name', 'description', 'display_image')
    inlines = [TreatmentInline, SuggestInline]


@admin.register(Symptom)
class SymptomAdmin(MarkdownxModelAdmin):
    list_display = ('name',)
    inlines = [SuggestInline]

## Relations ##


@admin.register(Sell)
class SellAdmin(admin.ModelAdmin):
    list_display = ('pharmacy', 'medicine')


@admin.register(Treatment)
class TreatmentAdmin(admin.ModelAdmin):
    list_display = ('medicine', 'disease')


@admin.register(Suggest)
class SuggestAdmin(admin.ModelAdmin):
    list_display = ('symptom', 'disease')
