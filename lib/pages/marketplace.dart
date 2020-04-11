import 'package:cityprog/model/market.dart';
import 'package:cityprog/widgets/carpool_marketplace/market_lower_section.dart';
import 'package:cityprog/widgets/carpool_marketplace/marketplace_upper.dart';
import 'package:flutter/material.dart';

class MarketPlacePage extends StatefulWidget {

  @override
  _MarketPlacePageState createState() => _MarketPlacePageState();
}

class _MarketPlacePageState extends State<MarketPlacePage> {
  _MarketPlacePageState();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            MarketplaceUpper(
              onPressedBuy: () => _onBuyOnPress(),
              onPressedBrowse: () => _onBrowseOnPress(),
              onPressedSell: () => _onSellOnPress(),
            ),
            MarketLower(
                (MarketPost post) => _onMoreButtonPress(post)),
          ],
        ),
      ),
    );
  }

  void _onBuyOnPress() {
    print("buy pressed");
  }

  void _onBrowseOnPress() {
    print("browse pressed");
  }

  void _onSellOnPress() {
    print("sell pressed");
  }

  void _onMoreButtonPress(MarketPost post) {
    print("Posted by: ${post.postedBy} on ${post.postDate}");
  }
}
