import 'package:auto_size_text/auto_size_text.dart';
import 'package:cityprog/model/market.dart';
import 'package:cityprog/widgets/rows/trade_method_row.dart';
import 'package:flutter/material.dart';

import '../../strings/community_strings.dart';
import '../../styles/color_palette.dart';

class MarketPostWidget extends StatelessWidget {
  final MarketPostData postData;
  final Function _moreButtonPressed;
  const MarketPostWidget(this.postData, this._moreButtonPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2,
        child: Wrap(
          children: <Widget>[
            TradeMethodRow(
              postData.tradeMethod,
              fontSize: 16,
              paddingAmount: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _autoSizeTextRow(postData.title, context,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28)),
                  ),
                  Padding(padding: EdgeInsets.all(4),),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _autoSizeTextRow(
                      postData.body,
                      context,
                      style: TextStyle(fontSize: 20)
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      child: Text(
                        LocalizedCommunityStrings.moreToLocalized(),
                        style: TextStyle(
                            color: AppColor.primary.color(), fontSize: 16),
                      ),
                      onPressed: () => _moreButtonPressed(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _autoSizeTextRow(String text, BuildContext context,
      {TextStyle style}) {
    return Container(
      child: Wrap(
        children: <Widget>[
          AutoSizeText(
            text,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: style == null
                ? TextStyle(
                    fontSize: 24,
                  )
                : style,
          ),
        ],
      ),
    );
  }
}
