import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';
import 'package:plantingapp/ui/HomePage.dart';
import 'package:plantingapp/ui/NewPlantPage.dart';
import 'package:plantingapp/ui/SplashScreenPage.dart';
import 'package:plantingapp/ui/ViewPlantPage.dart';

class PageRoutes {
  static Route<T> routeBuilder<T>(Widget page, RouteSettings settings) {
    return MaterialPageRoute<T>(builder: (context) => page, settings: settings);
  }

  /// Maps each route to a generated route widget
  static Route onGenerateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/home': return routeBuilder(HomePage(), settings);
      case '/view-plant': return routeBuilder(ViewPlantPage(settings.arguments as Plant), settings);
      case '/new-plant': return routeBuilder(NewPlantPage(), settings);
      case '/loading':
      default: return routeBuilder(SplashScreenPage(), settings,);
    }
  }
}