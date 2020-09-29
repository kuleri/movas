import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movas/router/demo_page/demo_page.dart';

/// use this class to make easy distinction between test routes,
/// and demo page to check on that stuff
class Router {
  static const String demoRoute = "demo";

  final Map<String, WidgetBuilder> routes;
  final Map<String, WidgetBuilder> demoRoutes;

  final String initialRoute;
  final bool useDemo;

  Router({
    this.routes,
    this.demoRoutes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.useDemo = true,
  });

  Map<String, WidgetBuilder> get calculateAllRoutes =>
      {...routes, ...demoRoutes, ..._demoHome};

  String get calculateInitialRoute => useDemo ? demoRoute : initialRoute;

  Map<String, WidgetBuilder> get _demoHome => useDemo
      ? {
    demoRoute: (context) =>
        DemoPage(testRoutes: demoRoutes, routes: routes)
  }
      : {};

}

