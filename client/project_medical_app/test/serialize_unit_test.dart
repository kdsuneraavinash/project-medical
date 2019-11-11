import 'package:flutter_test/flutter_test.dart';
import 'package:project_medical_app/logic/models/disease.dart';
import 'package:project_medical_app/logic/models/medicine.dart';

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
}
