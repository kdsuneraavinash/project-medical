from django.db import models
import uuid
from django.utils.html import escape, mark_safe


class Pharmacy(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255)
    description = models.TextField()
    langitude = models.FloatField()
    longitude = models.FloatField()
    address = models.CharField(max_length=255)
    phone_number = models.CharField(max_length=15)
    image_url = models.CharField(max_length=200, default='')
    timestamp = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name_plural = "pharmacies"

    def display_image(self):
        return mark_safe(u'<img src="%s" height=50/>' % escape(self.image_url))

    def __str__(self):
        return self.name


class Medicine(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255)
    description = models.TextField()
    image_url = models.CharField(max_length=200, default='')
    timestamp = models.DateTimeField(auto_now_add=True)

    def display_image(self):
        return mark_safe(u'<img src="%s" height=50/>' % escape(self.image_url))

    def __str__(self):
        return self.name


class PharmacyMedicine(models.Model):
    pharmacy = models.ForeignKey(
        Pharmacy, on_delete=models.CASCADE, related_name="pharmacymedicine")
    medicine = models.ForeignKey(
        Medicine, on_delete=models.CASCADE, related_name="pharmacymedicine")
    timestamp = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = (("pharmacy", "medicine"),)

    def __str__(self):
        return f"{self.pharmacy.name} has medicine {self.medicine.name}"


class Disease(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255)
    description = models.TextField()
    image_url = models.CharField(max_length=200, default='')
    timestamp = models.DateTimeField(auto_now_add=True)

    def display_image(self):
        return mark_safe(u'<img src="%s" height=50/>' % escape(self.image_url))

    def __str__(self):
        return self.name


class MedicineDisease(models.Model):
    medicine = models.ForeignKey(
        Medicine, on_delete=models.CASCADE, related_name="medicinedisease")
    disease = models.ForeignKey(
        Disease, on_delete=models.CASCADE, related_name="medicinedisease")
    timestamp = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = (("medicine", "disease"),)

    def __str__(self):
        return f"{self.disease.name} has medicine {self.medicine.name}"
