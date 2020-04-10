import 'package:flutter/material.dart';

import '../rows/two_button_row.dart';
import '../../strings/community_strings.dart';
import '../../styles/color_palette.dart';
import '../../strings/string_provider.dart' show Language;

class UpperSection extends StatelessWidget {
  final Language language;
  final Function onPressedOffer;
  final Function onPressedAsk;
  final Function onPressedBrowse;
  // isCarpoolPage flag used to display right text content
  // -> Offer, Ask for carpool -- Sell, Buy for marketplace
  final bool isCarpoolPage;
  const UpperSection({
    @required this.language,
    @required this.onPressedOffer,
    @required this.onPressedAsk,
    @required this.onPressedBrowse,
    @required this.isCarpoolPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: _body(),
    ));
  }

  Widget _body() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buttonColumn(),
      ],
    );
  }

  Widget _buttonColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TwoButtonRow(
          textLeft: isCarpoolPage
              ? LocalizedCommunityStrings.offerToLocalized(language)
              : LocalizedCommunityStrings.sellToLocalized(language),
          textRight: isCarpoolPage
              ? LocalizedCommunityStrings.askToLocalized(language)
              : LocalizedCommunityStrings.buyToLocalized(language),
          onPressedLeft: () => onPressedOffer(),
          onPressedRight: () => onPressedAsk(),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        _browseButtoN(),
      ],
    );
  }

  Widget _browseButtoN() {
    return Row(
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            color: AppColor.button.color(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 16,
              ),
              child: Text(
                LocalizedCommunityStrings.browseToLocalized(language),
                style: TextStyle(
                  color: AppColor.buttonText.color(),
                  fontSize: 20,
                ),
              ),
            ),
            onPressed: () => onPressedBrowse(),
          ),
        )
      ],
    );
  }
}
