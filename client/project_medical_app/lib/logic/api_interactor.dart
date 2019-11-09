import 'package:dio/dio.dart';
import 'package:project_medical_app/logic/models/disease.dart';

class ApiInteractor {
  final Dio _dio;
  final String _baseUrl;

  ApiInteractor(this._baseUrl) : _dio = Dio();

  Future<List<Disease>> searchDiseases(String query) async {
    Response response = await _dio.get(
      "$_baseUrl/api/disease",
      queryParameters: {"search": query},
    );
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(response.data)
          .map((v) => Disease.fromMap(v))
          .toList();
    }
    throw Exception("Error: ${response.statusCode}");
  }
}
