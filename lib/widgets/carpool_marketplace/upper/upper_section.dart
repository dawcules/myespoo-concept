import 'package:flutter/material.dart';

import '../../rows/two_button_row.dart';
import '../../../strings/community_strings.dart';
import '../../../styles/color_palette.dart';

class UpperSection extends StatefulWidget {
  final Function onPressedOffer;
  final Function onPressedAsk;
  final Function onPressedBrowse;
  // isCarpoolPage flag used to display right text content
  // -> Offer, Ask for carpool -- Sell, Buy for marketplace
  final bool isCarpoolPage;
  const UpperSection({
    @required this.onPressedOffer,
    @required this.onPressedAsk,
    @required this.onPressedBrowse,
    @required this.isCarpoolPage,
    
  });

  @override
  _UpperSectionState createState() => _UpperSectionState();
}

class _UpperSectionState extends State<UpperSection> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _body(),
      )),
    );
  }

  Widget _body() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        isExpanded
            ? _buttonColumn()
            : Padding(
                padding: EdgeInsets.all(0),
              ),
        Padding(
          padding: EdgeInsets.only(top: 8),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RotatedBox(
              quarterTurns: isExpanded ? 0 : 2,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_drop_up,
                  size: 35,
                ),
                onPressed: () => setState(() => isExpanded = !isExpanded),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buttonColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TwoButtonRow(
          textLeft: widget.isCarpoolPage
              ? LocalizedCommunityStrings.offerToLocalized()
              : LocalizedCommunityStrings.sellToLocalized(),
          textRight: widget.isCarpoolPage
              ? LocalizedCommunityStrings.askToLocalized()
              : LocalizedCommunityStrings.buyToLocalized(),
          onPressedLeft: () => widget.onPressedOffer(),
          onPressedRight: () => widget.onPressedAsk(),
          rightIsNull: widget.onPressedAsk == null ? true : false,
          leftIsNull: widget.onPressedOffer == null ? true : false,
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
                LocalizedCommunityStrings.browseToLocalized(),
                style: TextStyle(
                  color: AppColor.buttonText.color(),
                  fontSize: 20,
                ),
              ),
            ),
            onPressed: widget.onPressedBrowse != null ? () => widget.onPressedBrowse() : null,
          ),
        )
      ],
    );
  }
}
