from django.test import TestCase
from search.models import *


class ModelTest(TestCase):
    def create_disease(self, name="Disease", image_url="IMAGE",
                       description="disease"*20):
        return Disease.objects.create(name=name,
                                      description=description,
                                      image_url=image_url)

    def create_medicine(self, name="Medicine", image_url="IMAGE",
                        description="disease"*20):
        return Medicine.objects.create(name=name,
                                       description=description,
                                       image_url=image_url)

    def create_pharmacy(self, name="Pharmacy",  image_url="IMAGE",
                        description="disease"*20):
        return Pharmacy.objects.create(name=name,
                                       description=description,
                                       langitude=0,
                                       longitude=0,
                                       address="address",
                                       phone_number="0982233456",
                                       image_url=image_url)

    def create_symptom(self, name="Symptom"):
        return Symptom.objects.create(name=name)

    def get_correct_image_url(self, url):
        return f'<img src="{url}" height=50/>'

    def test_disease_image(self):
        disease = self.create_disease(image_url="https://disease")
        self.assertTrue(isinstance(disease, Disease))
        self.assertEqual(disease.display_image(),
                         self.get_correct_image_url("https://disease"))

    def test_medicine_image(self):
        medicine = self.create_medicine(image_url="https://medicine")
        self.assertTrue(isinstance(medicine, Medicine))
        self.assertEqual(medicine.display_image(),
                         self.get_correct_image_url("https://medicine"))

    def test_pharmacy_image(self):
        pharmacy = self.create_pharmacy(image_url="https://pharmacy")
        self.assertTrue(isinstance(pharmacy, Pharmacy))
        self.assertEqual(pharmacy.display_image(),
                         self.get_correct_image_url("https://pharmacy"))

    def test_disease_name(self):
        disease = self.create_disease(name="Disease123")
        self.assertTrue(isinstance(disease, Disease))
        self.assertEqual(disease.__str__(), "Disease123")

    def test_medicine_name(self):
        medicine = self.create_medicine(name="Medicine123")
        self.assertTrue(isinstance(medicine, Medicine))
        self.assertEqual(medicine.__str__(), "Medicine123")

    def test_pharmacy_name(self):
        pharmacy = self.create_pharmacy(name="Pharmacy123")
        self.assertTrue(isinstance(pharmacy, Pharmacy))
        self.assertEqual(pharmacy.__str__(), "Pharmacy123")

    def test_symptom_name(self):
        symptom = self.create_symptom(name="Symptom123")
        self.assertTrue(isinstance(symptom, Symptom))
        self.assertEqual(symptom.__str__(), "Symptom123")

    def test_treatment_name(self):
        disease = self.create_disease(name="DiseaseA")
        medicine = self.create_medicine(name="MedicineB")
        treatment = Treatment.objects.create(
            disease=disease, medicine=medicine)
        self.assertTrue(isinstance(treatment, Treatment))
        self.assertEqual(treatment.__str__(),
                         "MedicineB treats DiseaseA")

    def test_suggest_name(self):
        disease = self.create_disease(name="DiseaseA")
        symptom = self.create_symptom(name="SymptomB")
        suggest = Suggest.objects.create(
            disease=disease, symptom=symptom)
        self.assertTrue(isinstance(suggest, Suggest))
        self.assertEqual(suggest.__str__(),
                         "SymptomB suggests DiseaseA")

    def test_sell_name(self):
        medicine = self.create_medicine(name="MedicineA")
        pharmacy = self.create_pharmacy(name="PharmacyB")
        sell = Sell.objects.create(
            medicine=medicine, pharmacy=pharmacy)
        self.assertTrue(isinstance(sell, Sell))
        self.assertEqual(sell.__str__(),
                         "PharmacyB sells MedicineA")

    def test_disease_description(self):
        desciption = "DESCripTion"*20
        disease = self.create_disease(description=desciption)
        self.assertTrue(isinstance(disease, Disease))
        self.assertEqual(disease.snippet(), desciption[:100])

    def test_medicine_description(self):
        desciption = "DESCripTion"*20
        medicine = self.create_medicine(description=desciption)
        self.assertTrue(isinstance(medicine, Medicine))
        self.assertEqual(medicine.snippet(), desciption[:100])

    def test_pharmacy_description(self):
        desciption = "DESCripTion"*20
        pharmacy = self.create_pharmacy(description=desciption)
        self.assertTrue(isinstance(pharmacy, Pharmacy))
        self.assertEqual(pharmacy.snippet(), desciption[:100])
