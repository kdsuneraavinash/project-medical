import 'package:flutter_test/flutter_test.dart';
import 'package:project_medical_app/logic/models/disease.dart';
import 'package:project_medical_app/logic/models/medicine.dart';
import 'package:project_medical_app/logic/models/pharmacy.dart';
import 'package:project_medical_app/logic/models/symptom.dart';

void main() {
  test('Disease Result Model Serialize', () {
    var diseaseResult = {
      "id": "96866cdb-0d31-42be-bd30-36d5db69caa8",
      "snippet": "**Dengue** (pronounced DENgee) feverting...",
      "name": "Dengue",
      "image_url": "https://medlineplus.gov/images/Dengue.jpg",
      "timestamp": "2019-11-09T05:49:11.850932Z"
    };

    Disease obj;
    obj = Disease.fromMap(diseaseResult);
    expect(obj, isNotNull);
    expect(obj, isInstanceOf<Disease>());
    expect(obj.id, equals("96866cdb-0d31-42be-bd30-36d5db69caa8"));
    expect(obj.snippet, isNotNull);
    expect(obj.description, isNull);
    expect(obj.timestamp.day, equals(9));
  });

  test('Disease Model Serialize', () {
    var disease = {
      "id": "96866cdb-0d31-42be-bd30-36d5db69caa8",
      "name": "Dengue",
      "description": "**Dengue** (pronounced DENgee) ating mosquito-borne...",
      "image_url": "https://medlineplus.gov/images/Dengue.jpg",
      "timestamp": "2019-11-09T05:49:11.850932Z"
    };

    Disease obj;
    obj = Disease.fromMap(disease);
    expect(obj, isNotNull);
    expect(obj, isInstanceOf<Disease>());
    expect(obj.id, equals("96866cdb-0d31-42be-bd30-36d5db69caa8"));
    expect(obj.description, isNotNull);
    expect(obj.snippet, isNull);
    expect(obj.timestamp.day, equals(9));
  });

  test('Medicine Result Model Serialize', () {
    var medicineResult = {
      "id": "254eaf24-22a7-46de-9b7d-f843861f478f",
      "snippet": "Simeprevir is an antiviral drug used in combinather",
      "name": "Simeprevir",
      "image_url": "https://5.imimg.com/data5/KR/HX/MY-2745020/simeprevir.jpg",
      "timestamp": "2019-11-09T06:16:23.100423Z"
    };

    Medicine obj;
    obj = Medicine.fromMap(medicineResult);
    expect(obj, isNotNull);
    expect(obj, isInstanceOf<Medicine>());
    expect(obj.id, equals("254eaf24-22a7-46de-9b7d-f843861f478f"));
    expect(obj.snippet, isNotNull);
    expect(obj.description, isNull);
    expect(obj.timestamp.day, equals(9));
  });

  test('Medicine Model Serialize', () {
    var medicine = {
      "id": "254eaf24-22a7-46de-9b7d-f843861f478f",
      "description": "Simeprevir is an antiviral drug used in combinather",
      "name": "Simeprevir",
      "image_url": "https://5.imimg.com/data5/KR/HX/MY-2745020/simeprevir.jpg",
      "timestamp": "2019-11-09T06:16:23.100423Z"
    };

    Medicine obj;
    obj = Medicine.fromMap(medicine);
    expect(obj, isNotNull);
    expect(obj, isInstanceOf<Medicine>());
    expect(obj.id, equals("254eaf24-22a7-46de-9b7d-f843861f478f"));
    expect(obj.description, isNotNull);
    expect(obj.snippet, isNull);
    expect(obj.timestamp.day, equals(9));
  });

  test('Pharmacy Result Model Serialize', () {
    var pharmacyResult = {
      "id": "993b16ef-15a4-4758-90e0-134f2e06f435",
      "snippet":
          "New Philip Hospital, situated in the heart of the Kalutara Town is a 75 bed Hospital backed by a tea",
      "name": "New Philip Pharmacy",
      "address": "Kalutara, Sri Lanka.",
      "phone_number": "0342 222 888",
      "image_url": "https://www.philiphospitals.com/images/pharmacyheader.jpg",
      "timestamp": "2019-11-09T06:03:36.927812Z"
    };

    Pharmacy obj;
    obj = Pharmacy.fromMap(pharmacyResult);
    expect(obj, isNotNull);
    expect(obj, isInstanceOf<Pharmacy>());
    expect(obj.id, equals("993b16ef-15a4-4758-90e0-134f2e06f435"));
    expect(obj.snippet, isNotNull);
    expect(obj.description, isNull);
    expect(obj.timestamp.day, equals(9));
  });

  test('Pharmacy Model Serialize', () {
    var pharmacy = {
      "id": "993b16ef-15a4-4758-90e0-134f2e06f435",
      "description":
          "New Philip Hospital, situated in the heart of the Kalutara Town is a 75 bed Hospital backed by a tea",
      "langitude": 6.585191,
      "longitude": 79.963755,
      "address": "Kalutara, Sri Lanka.",
      "phone_number": "0342 222 888",
      "image_url": "https://www.philiphospitals.com/images/pharmacyheader.jpg",
      "timestamp": "2019-11-09T06:03:36.927812Z"
    };

    Pharmacy obj;
    obj = Pharmacy.fromMap(pharmacy);
    expect(obj, isNotNull);
    expect(obj, isInstanceOf<Pharmacy>());
    expect(obj.id, equals("993b16ef-15a4-4758-90e0-134f2e06f435"));
    expect(obj.description, isNotNull);
    expect(obj.snippet, isNull);
    expect(obj.longitude, equals(79.963755));
    expect(obj.timestamp.day, equals(9));
  });

  test('Symptom Result Model Serialize', () {
    var symptomResult = {
      "id": "934a7041-52e9-43e0-9fe2-893d5de37175",
      "name": "High fever"
    };

    Symptom obj;
    obj = Symptom.fromMap(symptomResult);
    expect(obj, isNotNull);
    expect(obj, isInstanceOf<Symptom>());
    expect(obj.id, equals("934a7041-52e9-43e0-9fe2-893d5de37175"));
    expect(obj.timestamp, isNull);
    expect(obj.name, equals("High fever"));
  });
}
