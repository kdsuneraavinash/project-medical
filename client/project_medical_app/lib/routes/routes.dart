import 'package:project_medical_app/views/home.dart';
import 'package:project_medical_app/views/search/diseases.dart';
import 'package:project_medical_app/views/search/medicine_view/medicine_view.dart';
import 'package:project_medical_app/views/search/pharmacy_view/pharmacy_view.dart';

import 'router.dart';

void defineAllRoutes() {
  AppRouter router = AppRouter();
  router.defineRoute(path: "/", handler: (_, __) => HomePage());
  router.defineRoute(
      path: "/search/:search",
      handler: (_, params) => DiseasesListView(search: params["search"][0]));
  router.defineRoute(
      path: "/pharmacy/:id",
      handler: (_, params) => PharmacyView(id: params["id"][0]));
}
