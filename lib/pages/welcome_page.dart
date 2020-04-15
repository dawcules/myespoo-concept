import 'package:cityprog/strings/navigation_strings.dart';
import 'package:cityprog/widgets/Backgrounds/background_widget.dart';
import 'package:cityprog/widgets/rows/icon_and_route_name.dart';
import 'package:cityprog/handlers/message_handler.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            BackgroundWidget(
              top: 24,
              heigth: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.height / 3,
              imageUrl: "assets/images/smartespoo.png",
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: generateNavigationButtons(context),
              ),
            ),
            MessageHandler(),
          ],
        ),
      ),
    );
  }

  Widget generateNavigationButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconRouteNameRow(
          heroTag: "nav_home",
          icon: Icon(Icons.home),
          route: "/home",
          routeName: NavigationStrings.homeToLocalized(),
          args: "Should I be removed or kept..?",
        ),
        IconRouteNameRow(
          heroTag: "nav_community",
          icon: Icon(Icons.people),
          route: "/community",
          routeName: NavigationStrings.communityToLocalized(),
        ),
        IconRouteNameRow(
          heroTag: "nav_communityHelp",
          icon: Icon(Icons.transfer_within_a_station),
          route: "/communityHelp",
          routeName: NavigationStrings.helpServicesToLocalized(),
        ),
        IconRouteNameRow(
          heroTag: "nav_personal",
          icon: Icon(Icons.person),
          route: "/personal",
          routeName: NavigationStrings.personalToLocalized(),
        ),
        IconRouteNameRow(
          heroTag: "nav_introduction",
          icon: Icon(Icons.help),
          route: "/introduction",
          routeName: NavigationStrings.introductionToLocalized(),
        ),
      ],
    );
  }
}
