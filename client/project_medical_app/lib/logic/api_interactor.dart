import 'package:dio/dio.dart';
import 'package:project_medical_app/logic/models/disease.dart';
import 'package:project_medical_app/logic/models/medicine.dart';
import 'package:project_medical_app/logic/models/pharmacy.dart';
import 'package:project_medical_app/logic/models/symptom.dart';

class ApiInteractor {
  final Dio _dio;

  ApiInteractor(this._dio);

  Future<List<Disease>> searchDiseases(String query) async {
    Response response = await _dio.get(
      "/api/disease",
      queryParameters: {"search": query},
    );
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(response.data)
          .map((v) => Disease.fromMap(v))
          .toList();
    }
    throw Exception("Error: ${response.statusCode}");
  }

  Future<Disease> getDisease(String id) async {
    Response response = await _dio.get("/api/disease/$id");
    if (response.statusCode == 200) {
      return Disease.fromMap(Map<String, dynamic>.from(response.data));
    }
    throw Exception("Error: ${response.statusCode}");
  }

  Future<Medicine> getMedicine(String id) async {
    Response response = await _dio.get("/api/medicine/$id");
    if (response.statusCode == 200) {
      return Medicine.fromMap(Map<String, dynamic>.from(response.data));
    }
    throw Exception("Error: ${response.statusCode}");
  }

  Future<Pharmacy> getPharmacy(String id) async {
    Response response = await _dio.get("/api/pharmacy/$id");
    if (response.statusCode == 200) {
      return Pharmacy.fromMap(Map<String, dynamic>.from(response.data));
    }
    throw Exception("Error: ${response.statusCode}");
  }

  Future<List<Symptom>> getSuggestions(String id) async {
    Response response = await _dio.get(
      "/api/suggest",
      queryParameters: {"id": id},
    );
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(response.data)
              .map((v) => Symptom.fromMap(v))
              .toList() ??
          [];
    }
    throw Exception("Error: ${response.statusCode}");
  }

  Future<List<Medicine>> getTreatments(String id) async {
    Response response = await _dio.get(
      "/api/treatment",
      queryParameters: {"id": id},
    );
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(response.data)
              .map((v) => Medicine.fromMap(v))
              .toList() ??
          [];
    }
    throw Exception("Error: ${response.statusCode}");
  }

  Future<List<Pharmacy>> getSellingPharmacies(String id) async {
    Response response = await _dio.get(
      "/api/sell",
      queryParameters: {"id": id},
    );
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(response.data)
              .map((v) => Pharmacy.fromMap(v))
              .toList() ??
          [];
    }
    throw Exception("Error: ${response.statusCode}");
  }
}
