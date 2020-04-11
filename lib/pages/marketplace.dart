import 'package:cityprog/model/market.dart';
import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/widgets/carpool_marketplace/forms/community_post_form.dart';
import 'package:cityprog/widgets/carpool_marketplace/lower/market_lower_section.dart';
import 'package:cityprog/widgets/carpool_marketplace/upper/marketplace_upper.dart';
import 'package:cityprog/widgets/carpool_marketplace/upper/upper_buttons_state.dart';
import 'package:cityprog/widgets/posts/community_post_modal.dart';
import 'package:cityprog/widgets/posts/market_post_modal.dart';
import 'package:flutter/material.dart';

class MarketPlacePage extends StatefulWidget {
  @override
  _MarketPlacePageState createState() => _MarketPlacePageState();
}

class _MarketPlacePageState extends State<MarketPlacePage> {
  UpperButtonsState state = UpperButtonsState.BROWSING;
  _MarketPlacePageState();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              MarketplaceUpper(
                onPressedBuy: () =>
                    _buttonShouldBeEnabled(UpperButtonsState.ASKING)
                        ? _buyOnPress()
                        : null,
                onPressedBrowse: () =>
                    _buttonShouldBeEnabled(UpperButtonsState.BROWSING)
                        ? _browseOnPress()
                        : null,
                onPressedSell: () =>
                    _buttonShouldBeEnabled(UpperButtonsState.PROVIDING)
                        ? _sellOnPress()
                        : null,
              ),
              _buildLowerSection()
            ],
          ),
        ),
      ),
    );
  }

  bool _buttonShouldBeEnabled(UpperButtonsState buttonState) {
    return state != buttonState;
  }

  Widget _buildLowerSection() {
    switch (state) {
      case UpperButtonsState.BROWSING:
        return MarketLower((MarketPost post) => _moreOnPress(post));
        break;
      case UpperButtonsState.PROVIDING:
        return CommunityPostForm(Trading.SELLING);
        break;
      case UpperButtonsState.ASKING:
        return CommunityPostForm(Trading.BUYING);
        break;
      default:
        return Text("404 - not found");
    }
  }

  void _buyOnPress() {
    print("buy pressed");
    setState(() => state = UpperButtonsState.ASKING);
  }

  void _browseOnPress() {
    print("browse pressed");
    setState(() => state = UpperButtonsState.BROWSING);
  }

  void _sellOnPress() {
    print("sell pressed");
    setState(() => state = UpperButtonsState.PROVIDING);
  }

  void _moreOnPress(MarketPost post) {
    print("Posted by: ${post.postedBy} on ${post.postDate}");
    showDialog(
        context: context,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          child: CommunityPostModal(MarketPostModal(post)),
        ));
  }
}