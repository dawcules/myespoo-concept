import 'package:cityprog/pages/community_help_cat_page.dart';
import 'package:cityprog/widgets/navigation/navigation_drawer.dart';
import 'package:cityprog/widgets/navigation/speech_nav_overlay.dart';
import 'package:flutter/material.dart';

//import './pages/navigation_page.dart';
import './pages/community_page.dart';
import './pages/introduction_page.dart';
//import './pages/personal_page.dart';
import 'pages/community_help_sign_page.dart';
import 'pages/community_help_main_page.dart';
import 'pages/community_help_request.dart';
import './pages/carpool.dart';
import './pages/login_page.dart';
import './pages/profile_creation.dart';
import './pages/marketplace.dart';
import './pages/general_feed.dart';

// https://www.youtube.com/watch?v=nyvwx7o277U

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/': // The absolute first page
        return MaterialPageRoute(
            builder: (_) => SpeechNavigationOverlay(child: IntroductionPage()));
      case '/home':
        return MaterialPageRoute(
            builder: (_) => SpeechNavigationOverlay(child: GeneralFeed()));
      case '/community':
        return MaterialPageRoute(
            builder: (_) => SpeechNavigationOverlay(child: CommunityPage()));
      case '/communityHelp':
        return MaterialPageRoute(
            builder: (_) =>
                SpeechNavigationOverlay(child: CommunityHelpMain()));
      case '/communityHelpSign':
        return MaterialPageRoute(
            builder: (_) =>
                SpeechNavigationOverlay(child: CommunityHelpPage()));
      case '/communityHelpRequest':
        return MaterialPageRoute(
            builder: (_) =>
                SpeechNavigationOverlay(child: CommunityHelpRequest()));
      case '/communityHelpCat':
        return MaterialPageRoute(
            builder: (_) =>
                SpeechNavigationOverlay(child: CommunityHelpCat(args)));
      case '/personal':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/introduction':
        return MaterialPageRoute(
            builder: (_) => SpeechNavigationOverlay(
                  child: IntroductionPage(),
                ));
      case '/carpool':
        return MaterialPageRoute(
            builder: (_) => SpeechNavigationOverlay(child: CarpoolPage()));
      case '/profile':
        return MaterialPageRoute(
            builder: (_) => SpeechNavigationOverlay(child: ProfilePage()));
      case '/market':
        return MaterialPageRoute(
            builder: (_) => SpeechNavigationOverlay(child: MarketPlacePage()));
      case '/market_new':
        return MaterialPageRoute(
          builder: (_) => SpeechNavigationOverlay(
              child: MarketPlacePage(
            navigatedWithNewCommand: true,
          )),
        );
      case '/carpool_new':
        return MaterialPageRoute(
          builder: (_) => SpeechNavigationOverlay(
              child: CarpoolPage(
            navigatedWithNewCommand: true,
          )),
        );
      case "/navigation_drawer":
        return PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) {
              return NavigationDrawer();
            });

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

enum Routes {
  HOME,
  PERSONAL,
  COMMUNITY,
  INTRODUCTION,
  CARPOOL,
  PROFILE,
  COMMUNITYHELP,
  MARKETPLACE,
  MARKET_NEW,
  CARPOOL_NEW,
  NAVIGATION_DRAWER,
}

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
      case Routes.CARPOOL:
        return "/carpool";
        break;
      case Routes.PROFILE:
        return "/profile";
        break;
      case Routes.MARKETPLACE:
        return "/market";
      case Routes.MARKET_NEW:
        return "/market_new";
      case Routes.CARPOOL_NEW:
        return "/carpool_new";
      case Routes.NAVIGATION_DRAWER:
        return "/navigation_drawer";
      default:
        return "/lookslikea404";
        break;
    }
  }
}
