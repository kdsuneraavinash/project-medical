import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:theme_provider/theme_provider.dart';

class AppRouter {
  factory AppRouter() {
    return _instance ??= AppRouter._internal();
  }

  AppRouter._internal() {
    _router = Router();
  }

  static AppRouter _instance;
  Router _router = Router();

  static RouteFactory get generator => AppRouter()._router.generator;
  static Router get _fluroRouter => AppRouter()._router;

  void defineRoute({
    @required String path,
    @required HandlerFunc handler,
  }) {
    _router.define(
      path,
      handler: Handler(
        handlerFunc: (context, map) => ThemeConsumer(
          child: handler(context, map),
        ),
        type: HandlerType.route,
      ),
    );
  }

  void defineFunction({
    @required String path,
    @required HandlerFunc handler,
  }) {
    _router.define(
      path,
      handler: Handler(
        handlerFunc: handler,
        type: HandlerType.function,
      ),
    );
  }

  static Future<dynamic> navigate(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      TransitionType transition}) {
    return _fluroRouter.navigateTo(
      context,
      path,
      transition: transition ?? TransitionType.cupertino,
      replace: replace ?? false,
      clearStack: clearStack ?? false,
    );
  }

  static Future<dynamic> freshNavigate(BuildContext context, String path) {
    return _fluroRouter.navigateTo(
      context,
      path,
      transition: TransitionType.fadeIn,
      replace: true,
      clearStack: true,
    );
  }

  static Future<T> directNavigate<T>(
      BuildContext context, WidgetBuilder callback) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => callback(_),
      ),
    );
  }
}
