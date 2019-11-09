from django.db import models
import uuid
from django.utils.html import escape, mark_safe
from markdownx.models import MarkdownxField


class Pharmacy(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255)
    description = MarkdownxField()
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

    def snippet(self):
        return self.description[:100]

    def __str__(self):
        return self.name


class Medicine(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255)
    description = MarkdownxField()
    image_url = models.CharField(max_length=200, default='')
    timestamp = models.DateTimeField(auto_now_add=True)

    def display_image(self):
        return mark_safe(u'<img src="%s" height=50/>' % escape(self.image_url))

    def snippet(self):
        return self.description[:100]

    def __str__(self):
        return self.name


class Disease(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255)
    description = MarkdownxField()
    image_url = models.CharField(max_length=200, default='')
    timestamp = models.DateTimeField(auto_now_add=True)

    def display_image(self):
        return mark_safe(u'<img src="%s" height=50/>' % escape(self.image_url))

    def snippet(self):
        return self.description[:100]

    def __str__(self):
        return self.name


class Symptom(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255)
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name


## Relations ##

class Sell(models.Model):
    pharmacy = models.ForeignKey(
        Pharmacy, on_delete=models.CASCADE, related_name="sell")
    medicine = models.ForeignKey(
        Medicine, on_delete=models.CASCADE, related_name="sell")
    timestamp = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = (("pharmacy", "medicine"),)

    def __str__(self):
        return f"{self.pharmacy.name} sells {self.medicine.name}"


class Treatment(models.Model):
    disease = models.ForeignKey(
        Disease, on_delete=models.CASCADE, related_name="treatment")
    medicine = models.ForeignKey(
        Medicine, on_delete=models.CASCADE, related_name="treatment")
    timestamp = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = (("medicine", "disease"),)

    def __str__(self):
        return f"{self.medicine.name} treats {self.disease.name}"


class Suggest(models.Model):
    symptom = models.ForeignKey(
        Symptom, on_delete=models.CASCADE, related_name="suggest")
    disease = models.ForeignKey(
        Disease, on_delete=models.CASCADE, related_name="suggest")
    timestamp = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = (("symptom", "disease"),)

    def __str__(self):
        return f" {self.symptom.name} suggests {self.disease.name}"
