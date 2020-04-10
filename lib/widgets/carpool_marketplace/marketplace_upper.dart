import 'package:flutter/material.dart';

import './upper_section.dart';
import '../../strings/string_provider.dart' show Language;

class MarketplaceUpper extends StatelessWidget {
  final Language language;
  final Function onPressedSell;
  final Function onPressedBuy;
  final Function onPressedBrowse;
  const MarketplaceUpper({
    @required this.language,
    @required this.onPressedSell,
    @required this.onPressedBuy,
    @required this.onPressedBrowse,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: UpperSection(
        language: language,
        onPressedOffer: onPressedSell,
        onPressedAsk: onPressedBuy,
        onPressedBrowse: onPressedBrowse,
        isCarpoolPage: false,
      ),
    );
  }
}
