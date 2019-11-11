import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_medical_app/logic/api_interactor.dart';
import 'package:project_medical_app/logic/models/disease.dart';
import 'package:project_medical_app/logic/models/medicine.dart';
import 'package:project_medical_app/logic/models/pharmacy.dart';
import 'package:project_medical_app/logic/models/symptom.dart';

import 'mock_adapter.dart';

void main() {
  Dio dio;
  ApiInteractor interactor;

  setUp(() {
    dio = Dio();
    dio.options.baseUrl = MockAdapter.mockBase;
    dio.options.headers = {'User-Agent': 'dartisan', 'XX': '8'};
    dio.httpClientAdapter = MockAdapter();
    interactor = ApiInteractor(dio);
  });

  test('Search Query Test', () async {
    List<Disease> diseases = await interactor.searchDiseases("query");
    expect(diseases, isNotNull);
    expect(diseases, isNotEmpty);
    expect(diseases, isInstanceOf<List<Disease>>());
  });

  test('Search Query(No results) Test', () async {
    List<Disease> diseases = await interactor.searchDiseases("no-results");
    expect(diseases, isNotNull);
    expect(diseases, isEmpty);
  });

  test('Treatments Query Test', () async {
    List<Medicine> medicines =
        await interactor.getTreatments("96866cdb-0d31-42be-bd30-36d5db69caa8");
    expect(medicines, isNotNull);
    expect(medicines, isNotEmpty);
    expect(medicines, isInstanceOf<List<Medicine>>());
  });

  test('Treatments Query(No results) Test', () async {
    List<Medicine> medicines =
        await interactor.getTreatments("00000000-0000-0000-0000-000000000000");
    expect(medicines, isNotNull);
    expect(medicines, isEmpty);
  });

  test('Selling Pharmacies Query Test', () async {
    List<Pharmacy> pharmacies = await interactor
        .getSellingPharmacies("254eaf24-22a7-46de-9b7d-f843861f478f");
    expect(pharmacies, isNotNull);
    expect(pharmacies, isNotEmpty);
    expect(pharmacies, isInstanceOf<List<Pharmacy>>());
  });

  test('Selling Pharmacies Query(No results) Test', () async {
    List<Pharmacy> pharmacies = await interactor
        .getSellingPharmacies("00000000-0000-0000-0000-000000000000");
    expect(pharmacies, isNotNull);
    expect(pharmacies, isEmpty);
  });

  test('Suggesions Query Test', () async {
    List<Symptom> symptoms =
        await interactor.getSuggestions("96866cdb-0d31-42be-bd30-36d5db69caa8");
    expect(symptoms, isNotNull);
    expect(symptoms, isNotEmpty);
    expect(symptoms, isInstanceOf<List<Symptom>>());
  });

  test('Suggesions Query(No results) Test', () async {
    List<Symptom> symptoms =
        await interactor.getSuggestions("00000000-0000-0000-0000-000000000000");
    expect(symptoms, isNotNull);
    expect(symptoms, isEmpty);
  });

  test('Disease By Id Test', () async {
    String uid = "96866cdb-0d31-42be-bd30-36d5db69caa8";
    Disease disease = await interactor.getDisease(uid);
    expect(disease, isNotNull);
    expect(disease, isInstanceOf<Disease>());
    expect(disease.id, equals(uid));
  });

  test('Medicine By Id Test', () async {
    String uid = "254eaf24-22a7-46de-9b7d-f843861f478f";
    Medicine disease = await interactor.getMedicine(uid);
    expect(disease, isNotNull);
    expect(disease, isInstanceOf<Medicine>());
    expect(disease.id, equals(uid));
  });

  test('Pharmacy By Id Test', () async {
    String uid = "993b16ef-15a4-4758-90e0-134f2e06f435";
    Pharmacy disease = await interactor.getPharmacy(uid);
    expect(disease, isNotNull);
    expect(disease, isInstanceOf<Pharmacy>());
    expect(disease.id, equals(uid));
  });

  test('Disease By Non Existing Id Test', () async {
    String uid = "00000000-0000-0000-0000-000000000000";
    expect(
      () async => await interactor.getDisease(uid),
      throwsA(isInstanceOf<DioError>()),
    );
  });
  test('Medicine By Non Existing Id Test', () async {
    String uid = "00000000-0000-0000-0000-000000000000";
    expect(
      () async => await interactor.getMedicine(uid),
      throwsA(isInstanceOf<DioError>()),
    );
  });

  test('Pharmacy By Non Existing Id Test', () async {
    String uid = "00000000-0000-0000-0000-000000000000";
    expect(
      () async => await interactor.getPharmacy(uid),
      throwsA(isInstanceOf<DioError>()),
    );
  });
}
