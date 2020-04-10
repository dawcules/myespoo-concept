import 'package:auto_size_text/auto_size_text.dart';
import 'package:cityprog/model/market.dart';
import 'package:flutter/material.dart';

import '../../strings/community_strings.dart';
import '../../strings/string_provider.dart' show Language;
import '../../model/trade_methods.dart';
import '../../styles/color_palette.dart';

class MarketPostWidget extends StatelessWidget {
  final MarketPost postData;
  final Language language;
  final Function _contactButtonPressed;
  const MarketPostWidget(
      this.postData, this.language, this._contactButtonPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            child: Row(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: FlatButton(
                        child: Text(
                          LocalizedCommunityStrings.contactToLocalized(
                              language),
                          style: TextStyle(
                            color: AppColor.primary.color(),
                          ),
                        ),
                        onPressed: () => _contactButtonPressed(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
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
