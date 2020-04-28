import 'package:flutter/material.dart';

import './upper_section.dart';

class MarketplaceUpper extends StatelessWidget {
  final Function onPressedSell;
  final Function onPressedBuy;
  final Function onPressedBrowse;
  const MarketplaceUpper({
    @required this.onPressedSell,
    @required this.onPressedBuy,
    @required this.onPressedBrowse,
    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: UpperSection(
        onPressedOffer: onPressedSell,
        onPressedAsk: onPressedBuy,
        onPressedBrowse: onPressedBrowse,
        isCarpoolPage: false,
      ),
    );
  }
}
