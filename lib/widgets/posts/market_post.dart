import 'package:auto_size_text/auto_size_text.dart';
import 'package:cityprog/model/market.dart';
import 'package:cityprog/widgets/rows/trade_method_row.dart';
import 'package:flutter/material.dart';

import '../../strings/community_strings.dart';
import '../../styles/color_palette.dart';

class MarketPostWidget extends StatelessWidget {
  final MarketPost postData;
  final Function _moreButtonPressed;
  const MarketPostWidget(this.postData, this._moreButtonPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            child: Column(
      children: <Widget>[
        TradeMethodRow(postData.tradeMethod),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.topCenter,
                child: Icon(
                  Icons.face,
                  size: 100,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        _autoSizeTextTwoInputs(postData.title, "", context,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        Padding(
                          padding: EdgeInsets.all(4),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: _autoSizeTextTwoInputs(
                            postData.body,
                            "",
                            context,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: FlatButton(
                            child: Text(
                              LocalizedCommunityStrings.moreToLocalized(),
                              style: TextStyle(
                                color: AppColor.primary.color(),
                                fontSize: 20
                              ),
                            ),
                            onPressed: () => _moreButtonPressed(),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    )));
  }

  Widget _autoSizeTextTwoInputs(String left, String right, BuildContext context,
      {TextStyle style}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: AutoSizeText(
              "$left $right",
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: style == null
                  ? TextStyle(
                      fontSize: 20,
                    )
                  : style,
            ),
          ),
        ],
      ),
    );
  }
}
