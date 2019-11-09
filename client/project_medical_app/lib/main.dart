import 'package:flutter/material.dart';
import 'package:project_medical_app/logic/api_interactor.dart';
import 'package:project_medical_app/logic/stack_manager.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

import './routes/router.dart';
import './routes/routes.dart';
import 'theme.dart';
import 'utils/helpers.dart';

void main() {
  defineAllRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<StackManager>.value(
          value: StackManager(),
        ),
        Provider<ApiInteractor>.value(
          value: ApiInteractor("https://project-medical.herokuapp.com"),
        ),
      ],
      child: ThemeProvider(
        saveThemesOnChange: true,
        loadThemeOnInit: true,
        onThemeChanged: (_, newTheme) {
          Helpers.setStatusBarColor(newTheme.data.primaryColor);
        },
        themes: [
          lightTheme(),
          darkTheme(),
          blackTheme(),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Project Medical",
          onGenerateRoute: AppRouter.generator,
          initialRoute: '/',
        ),
      ),
    );
  }
}
