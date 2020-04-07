import 'package:cityprog/widgets/carpool_marketplace/carpool_lower_section.dart';
import 'package:flutter/material.dart';

import '../widgets/carpool_marketplace/carpool_upper.dart';
import '../strings/string_provider.dart' show Language;

class CarpoolPage extends StatefulWidget {
  final Language _language;
  const CarpoolPage(this._language);

  @override
  _CarpoolPageState createState() => _CarpoolPageState(_language);
}

class _CarpoolPageState extends State<CarpoolPage> {
  final language;
  _CarpoolPageState(this.language);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: <Widget>[
            CarpoolUpper(
              language: _getLocale(),
              onPressedOffer: () => _offerPressed(),
              onPressedAsk: () => _askPressed(),
              onPressedBrowse: () => _browsePressed(),
            ),
            CarpoolLower(language, (int pos) => _contactPressed(pos)),
          ],
        )),
      ),
    );
  }

  Language _getLocale() {
    return Language.EN; // Need to implement this for every page
  }

  void _contactPressed(int position) {
    print("contact button pressed. Position: $position");
  }

  void _offerPressed() {
    print("offer button pressed");
  }

  void _askPressed() {
    print("ask button pressed");
  }

  void _browsePressed() {
    print("browse button pressed");
  }
}
