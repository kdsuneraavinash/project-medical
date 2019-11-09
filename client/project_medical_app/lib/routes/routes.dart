import 'package:project_medical_app/views/home.dart';

import 'router.dart';

void defineAllRoutes() {
  AppRouter router = AppRouter();
  router.defineRoute(path: "/", handler: (_, __) => HomePage());
}
