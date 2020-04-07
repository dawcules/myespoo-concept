import 'package:flutter/material.dart';

import './upper_section.dart';
import '../../strings/string_provider.dart' show Language;

class MarketplaceUpper extends StatelessWidget {
  final Language language;
  final Function onPressedOffer;
  final Function onPressedAsk;
  final Function onPressedBrowse;
  const MarketplaceUpper({
    @required this.language,
    @required this.onPressedOffer,
    @required this.onPressedAsk,
    @required this.onPressedBrowse,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: UpperSection(
        language: language,
        onPressedOffer: onPressedOffer,
        onPressedAsk: onPressedAsk,
        onPressedBrowse: onPressedBrowse,
        isCarpoolPage: false,
      ),
    );
  }
}
