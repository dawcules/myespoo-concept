import 'package:cityprog/model/carpool.dart';
import 'package:cityprog/widgets/carpool_marketplace/carpool_lower_section.dart';
import 'package:flutter/material.dart';

import '../widgets/carpool_marketplace/carpool_upper.dart';

class CarpoolPage extends StatefulWidget {
  const CarpoolPage();

  @override
  _CarpoolPageState createState() => _CarpoolPageState();
}

class _CarpoolPageState extends State<CarpoolPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: <Widget>[
            CarpoolUpper(
              onPressedOffer: () => _onOfferPressed(),
              onPressedAsk: () => _onAskPressed(),
              onPressedBrowse: () => _onBrowsePressed(),
            ),
            CarpoolLower((CarpoolPost post) => _onMorePressed(post)),
          ],
        )),
      ),
    );
  }

  void _onMorePressed(CarpoolPost post) {
    print("more button pressed. Post by: ${post.postedBy}");
  }

  void _onOfferPressed() {
    print("offer button pressed");
  }

  void _onAskPressed() {
    print("ask button pressed");
  }

  void _onBrowsePressed() {
    print("browse button pressed");
  }
}
