import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';
import 'package:plantingapp/ui/HomePage.dart';
import 'package:plantingapp/ui/LearnMorePage.dart';
import 'package:plantingapp/ui/NewPlantPage.dart';
import 'package:plantingapp/ui/SplashScreenPage.dart';
import 'package:plantingapp/ui/ViewPlantPage.dart';
import 'package:plantingapp/ui/NewVinePage.dart';
import 'package:plantingapp/ui/ViewVinePage.dart';
import 'package:plantingapp/ui/MyPlantsPage.dart';

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
      case '/view-vine': return routeBuilder(ViewVinePage(settings.arguments as Vine), settings);
      case '/new-vine': return routeBuilder(NewVinePage(), settings);

      // case '/udpate-plants': return routeBuilder(ViewPlantPage(settings.arguments as Plant), settings);
      case '/udpate-plants': return routeBuilder(MyPlantsPage(), settings);

      case '/learn-more': return routeBuilder(LearnMorePage(), settings);
      case '/loading':
      default: return routeBuilder(SplashScreenPage(), settings,);
    }
  }
}