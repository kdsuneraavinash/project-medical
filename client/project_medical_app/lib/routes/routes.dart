import 'package:project_medical_app/views/home.dart';
import 'package:project_medical_app/views/results/disease_view/disease_view.dart';
import 'package:project_medical_app/views/results/diseases.dart';

import 'router.dart';

void defineAllRoutes() {
  AppRouter router = AppRouter();
  router.defineRoute(path: "/", handler: (_, __) => HomePage());
  router.defineRoute(
      path: "/search/:search",
      handler: (_, params) => DiseasesListView(search: params["search"][0]));
  router.defineRoute(
      path: "/disease/:id",
      handler: (_, params) => DiseaseView(id: params["id"][0]));
}
