import 'package:cityprog/model/carpool.dart';
import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/widgets/carpool_marketplace/carpool_lower_section.dart';
import 'package:cityprog/widgets/carpool_marketplace/community_post_form.dart';
import 'package:cityprog/widgets/carpool_marketplace/upper_buttons_state.dart';
import 'package:flutter/material.dart';

import '../widgets/carpool_marketplace/carpool_upper.dart';

class CarpoolPage extends StatefulWidget {
  const CarpoolPage();

  @override
  _CarpoolPageState createState() => _CarpoolPageState();
}

class _CarpoolPageState extends State<CarpoolPage> {
  UpperButtonsState state = UpperButtonsState.BROWSING;
  bool toggler = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
            child: Column(
          children: <Widget>[
            CarpoolUpper(
              onPressedOffer: () =>
                  _buttonShouldBeEnabled(UpperButtonsState.PROVIDING)
                      ? _onOfferPressed()
                      : null,
              onPressedAsk: () =>
                  _buttonShouldBeEnabled(UpperButtonsState.ASKING)
                      ? _onAskPressed()
                      : null,
              onPressedBrowse: () =>
                  _buttonShouldBeEnabled(UpperButtonsState.BROWSING)
                      ? _onBrowsePressed()
                      : null,
            ),
            _buildLowerSection(),
          ],
        )),
      ),
    );
  }

  // If current state != the state that the button is describing
  // -> return true (Meaning that you could navigate to that page if you aren't there already)
  bool _buttonShouldBeEnabled(UpperButtonsState buttonState) {
    return state != buttonState;
  }

  Widget _buildLowerSection() {
    switch (state) {
      case UpperButtonsState.BROWSING:
        return CarpoolLower((CarpoolPost post) => _onMorePressed(post));
        break;
      case UpperButtonsState.PROVIDING:
        return CommunityPostForm(Trading.OFFERING);
        break;
      case UpperButtonsState.ASKING:
        return CommunityPostForm(Trading.ASKING);
        break;
      default:
        return Text("404 - not found");
    }
  }

  void _onMorePressed(CarpoolPost post) {
    print("more button pressed. Post by: ${post.postedBy}");
  }

  void _onOfferPressed() {
    print("offer pressed");
    setState(() => state = UpperButtonsState.PROVIDING);
  }

  void _onAskPressed() {
    print("ask pressed");
    setState(() => state = UpperButtonsState.ASKING);
  }

  void _onBrowsePressed() {
    print("browse pressed");
    setState(() => state = UpperButtonsState.BROWSING);
  }
}
