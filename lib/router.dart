import 'package:flutter/material.dart';

import './main.dart';
import './pages/welcome_page.dart';
import './pages/community_page.dart';
import './pages/introduction_page.dart';
import './pages/personal_page.dart';
import './pages/carpool.dart';
import './strings/string_provider.dart' show Language;

// https://www.youtube.com/watch?v=nyvwx7o277U

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/': // The absolute first page
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case '/home':
        return MaterialPageRoute(builder: (_) => MyHomePage(title: args));
      case '/community':
        return MaterialPageRoute(builder: (_) => CommunityPage());
      case '/personal':
        return MaterialPageRoute(builder: (_) => PersonalPage());
      case '/introduction':
        return MaterialPageRoute(builder: (_) => IntroductionPage());
      case '/carpool':
        return MaterialPageRoute(builder: (_) => CarpoolPage(Language.EN));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text("404 - ei löydy :D"),
        ),
      );
    });
  }
}

enum Routes { HOME, PERSONAL, COMMUNITY, INTRODUCTION, CARPOOL }

extension RoutePaths on Routes {
  String get name {
    switch (this) {
      case Routes.HOME:
        return "/home";
        break;
      case Routes.PERSONAL:
        return "/personal";
        break;
      case Routes.COMMUNITY:
        return "/community";
        break;
      case Routes.INTRODUCTION:
        return "/introduction";
        break;
      case Routes.CARPOOL:
        return "/carpool";
        break;
      default:
        return "lookslikea404";
        break;
    }
  }
}
