import 'package:cityprog/model/carpool.dart';
import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/widgets/carpool_marketplace/forms/community_post_form.dart';
import 'package:cityprog/widgets/carpool_marketplace/lower/carpool_lower_section.dart';
import 'package:cityprog/widgets/carpool_marketplace/upper/carpool_upper.dart';
import 'package:cityprog/widgets/carpool_marketplace/upper/upper_buttons_state.dart';
import 'package:cityprog/widgets/posts/carpool_post_modal.dart';
import 'package:cityprog/widgets/posts/community_post_modal.dart';
import 'package:flutter/material.dart';

class CarpoolPage extends StatefulWidget {
  final bool navigatedWithNewCommand;
  const CarpoolPage({this.navigatedWithNewCommand});

  @override
  _CarpoolPageState createState() => _CarpoolPageState();
}

class _CarpoolPageState extends State<CarpoolPage> {
  UpperButtonsState state;
  @override
  void initState() {
    super.initState();
    state = widget.navigatedWithNewCommand != null
        ? UpperButtonsState.PROVIDING
        : UpperButtonsState.BROWSING;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: state == UpperButtonsState.BROWSING
              ? Column(children: _content())
              : ListView(
                  children: _content(),
                ),
        ),
      ),
    );
  }

  List<Widget> _content() {
    return [
      CarpoolUpper(
        onPressedOffer: _buttonShouldBeEnabled(UpperButtonsState.PROVIDING)
            ? () => _onOfferPressed()
            : null,
        onPressedAsk: _buttonShouldBeEnabled(UpperButtonsState.ASKING)
            ? () => _onAskPressed()
            : null,
        onPressedBrowse: _buttonShouldBeEnabled(UpperButtonsState.BROWSING)
            ? () => _onBrowsePressed()
            : null,
      ),
      _buildLowerSection(),
    ];
  }

  bool _buttonShouldBeEnabled(UpperButtonsState buttonState) {
    return state != buttonState;
  }

  Widget _buildLowerSection() {
    switch (state) {
      case UpperButtonsState.BROWSING:
        return CarpoolLower((CarpoolPostData post) => _onMorePressed(post));
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

  void _onMorePressed(CarpoolPostData post) {
    print("more button pressed. Post by: ${post.postedBy}");
    showDialog(
        context: context,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
            child: CommunityPostModal(CarpoolPostModal(post))));
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
