import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:project_medical_app/logic/config.dart';

class MockAdapter extends HttpClientAdapter {
  static const String mockBase = Config.baseUrl;
  DefaultHttpClientAdapter _adapter = DefaultHttpClientAdapter();

  ResponseBody createResponse(dynamic response) {
    return ResponseBody.fromString(
      jsonEncode(response),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  Future<ResponseBody> fetch(RequestOptions options,
      Stream<List<int>> requestStream, Future cancelFuture) async {
    Uri uri = options.uri;
    if (mockBase.contains(uri.host)) {
      switch (uri.path) {
        case "/api/disease":
          if (uri.queryParameters["search"] == "no-results")
            return createResponse([]);
          return createResponse([
            {
              "id": "96866cdb-0d31-42be-bd30-36d5db69caa8",
              "snippet": "**Dengue** (pronounced DENgee) fever is a ",
              "name": "Dengue",
              "image_url": "https://medlineplus.gov/images/Dengue.jpg",
              "timestamp": "2019-11-09T05:49:11.850932Z"
            }
          ]);

        case "/api/treatment":
          if (uri.queryParameters["id"] !=
              "96866cdb-0d31-42be-bd30-36d5db69caa8") return createResponse([]);
          return createResponse([
            {
              "id": "254eaf24-22a7-46de-9b7d-f843861f478f",
              "description": "Simeprevir is an antiviral drug used in",
              "name": "Simeprevir",
              "image_url": "https://5.imimg.com/data5/KR/HX/MY-500x500.jpg",
              "timestamp": "2019-11-09T06:16:23.100423Z"
            }
          ]);
        case "/api/sell":
          if (uri.queryParameters["id"] !=
              "254eaf24-22a7-46de-9b7d-f843861f478f") return createResponse([]);
          return createResponse([
            {
              "id": "993b16ef-15a4-4758-90e0-134f2e06f435",
              "description": "New Philip Hospital, situated in th",
              "langitude": 6.585191,
              "longitude": 79.963755,
              "address": "Kalutara, Sri Lanka.",
              "phone_number": "0342 222 888",
              "image_url": "https://www.philiphospitals.com/pharmacyheader.jpg",
              "timestamp": "2019-11-09T06:03:36.927812Z"
            }
          ]);
        case "/api/suggest":
          if (uri.queryParameters["id"] !=
              "96866cdb-0d31-42be-bd30-36d5db69caa8") return createResponse([]);
          return createResponse([
            {"id": "934a7041-52e9-43e0-9fe2-893d5de37175", "name": "High fever"}
          ]);
        case "/api/disease/96866cdb-0d31-42be-bd30-36d5db69caa8":
          return createResponse({
            "id": "96866cdb-0d31-42be-bd30-36d5db69caa8",
            "description": "**Dengue** (pronounced DENgee) fever is a ",
            "name": "Dengue",
            "image_url": "https://medlineplus.gov/images/Dengue.jpg",
            "timestamp": "2019-11-09T05:49:11.850932Z"
          });
        case "/api/medicine/254eaf24-22a7-46de-9b7d-f843861f478f":
          return createResponse({
            "id": "254eaf24-22a7-46de-9b7d-f843861f478f",
            "description":
                "Simeprevir is an antiviral drug used in combination",
            "name": "Simeprevir",
            "image_url": "https://5.imimg.com/data5/KR/HX/MY-500x500.jpg",
            "timestamp": "2019-11-09T06:16:23.100423Z"
          });
        case "/api/pharmacy/993b16ef-15a4-4758-90e0-134f2e06f435":
          return createResponse({
            "id": "993b16ef-15a4-4758-90e0-134f2e06f435",
            "description": "New Philip Hospital, situated in th",
            "langitude": 6.585191,
            "longitude": 79.963755,
            "address": "Kalutara, Sri Lanka.",
            "phone_number": "0342 222 888",
            "image_url": "https://www.philiphospitals.com/pharmacyheader.jpg",
            "timestamp": "2019-11-09T06:03:36.927812Z"
          });
        default:
          return ResponseBody.fromString("URI not found: ${uri.path}", 404);
      }
    }
    return ResponseBody.fromString("Invalid server call", 404);
  }

  @override
  void close({bool force = false}) {
    _adapter.close(force: force);
  }
}
