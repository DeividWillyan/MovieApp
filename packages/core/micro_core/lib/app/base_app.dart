import 'package:flutter/material.dart';

import 'micro_app.dart';
import 'micro_core_utils.dart';

abstract class BaseApp {
  List<MicroApp> get microApps;

  Map<String, WidgetBuilderArgs> get baseRoutes;

  final Map<String, WidgetBuilderArgs> routes = {};

  void registerRouters() {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    if (microApps.isNotEmpty) {
      for (MicroApp microapp in microApps) {
        routes.addAll(microapp.routes);
      }
    }
  }

  void registerInjections() {
    if (microApps.isNotEmpty) {
      for (MicroApp microapp in microApps) {
        microapp.injectionsRegister();
      }
    }
  }

  void registerListeners() {
    if (microApps.isNotEmpty) {
      for (MicroApp microapp in microApps) {
        microapp.createListener();
      }
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    var routerName = settings.name;
    var routerArgs = settings.arguments;

    var navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}
