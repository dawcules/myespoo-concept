import 'package:flutter/material.dart';

import './main.dart';
import './pages/welcome_page.dart';
import './pages/community_page.dart';
import './pages/introduction_page.dart';
import './pages/personal_page.dart';
<<<<<<< HEAD
import 'pages/community_help_page.dart';
=======
import './pages/login_page.dart';
>>>>>>> fb206879112bab281284ef1d36b143494a64091e

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
      case '/communityHelp':
        return MaterialPageRoute(builder: (_) => CommunityHelpPage());
      case '/personal':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/introduction':
        return MaterialPageRoute(builder: (_) => IntroductionPage());
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

enum Routes { HOME, PERSONAL, COMMUNITY, COMMUNITYHELP, INTRODUCTION }

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
      case Routes.COMMUNITYHELP:
        return "/communityHelp";
      case Routes.INTRODUCTION:
        return "/introduction";
        break;
      default:
        return "lookslikea404";
        break;
    }
  }
}
