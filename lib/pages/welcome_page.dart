import '../sensor_utils/speech_recognition/speech_recog.dart';
import 'package:cityprog/handlers/message_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
      Widget bottomWidget;

      if (kIsWeb) {
        bottomWidget = Text ('Asenna sovellus käyttääksesi puhetoimintoja!');
      } else {
            bottomWidget = SpeechToAction();
      }

    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: generateNavigationButtons(context),
            ),
            Align(
              alignment: Alignment.bottomCenter * 0.5,
              child: bottomWidget,
            ),
            MessageHandler(),
          ],
        ),
      ),
    );
  }

  Widget generateNavigationButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.home),
          heroTag: "nav_home",
          onPressed: () => Navigator.of(context).pushNamed(
            "/home",
            arguments:
                "Pitäiskö poistaa app bar?", // argumentsiin voi laittaa mitä vaan, esim konstruktorin data.
          ), // -- täs tapaukses arguments muuttuu AppBar titleks
        ),
        Padding(padding: EdgeInsets.all(8)),
        FloatingActionButton(
          child: Icon(Icons.people),
          heroTag: "nav_community",
          onPressed: () => Navigator.of(context).pushNamed("/community"),
        ),
        Padding(padding: EdgeInsets.all(8)),
        FloatingActionButton(
          child: Icon(Icons.transfer_within_a_station),
          heroTag: "nav_communityHelp",
          onPressed: () => Navigator.of(context).pushNamed("/communityHelp"),
        ),
        Padding(padding: EdgeInsets.all(8)),
        FloatingActionButton(
          child: Icon(Icons.person),
          heroTag: "nav_personal",
          onPressed: () => Navigator.of(context).pushNamed("/personal"),
        ),
        Padding(padding: EdgeInsets.all(8)),
        FloatingActionButton(
          child: Icon(Icons.help),
          heroTag: "nav_introduction",
          onPressed: () => Navigator.of(context).pushNamed("/introduction"),
        ),
      ],
    );
  }
}