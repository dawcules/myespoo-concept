import 'package:cityprog/model/market.dart';
import 'package:cityprog/strings/string_provider.dart' show Language;
import 'package:cityprog/widgets/carpool_marketplace/market_lower_section.dart';
import 'package:cityprog/widgets/carpool_marketplace/marketplace_upper.dart';
import 'package:flutter/material.dart';

class MarketPlacePage extends StatefulWidget {
  final Language _language;
  const MarketPlacePage(this._language);

  @override
  _MarketPlacePageState createState() => _MarketPlacePageState(_language);
}

class _MarketPlacePageState extends State<MarketPlacePage> {
  Language language;
  _MarketPlacePageState(this.language);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            MarketplaceUpper(
              language: language,
              onPressedBuy: () => _onBuyOnPress(),
              onPressedBrowse: () => _onBrowseOnPress(),
              onPressedSell: () => _onSellOnPress(),
            ),
            MarketLower(language,
                (int pos, MarketPost post) => _onContactButtonPress(pos, post)),
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

  void _onContactButtonPress(int position, MarketPost post) {
    print("contact pressed at position: $position" +
        "\nPosted by: ${post.postedBy} on ${post.postDate}");
  }
}
