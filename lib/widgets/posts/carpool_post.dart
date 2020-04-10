import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../model/carpool.dart';
import '../../strings/community_strings.dart';
import '../../strings/string_provider.dart' show Language;
import '../../model/trade_methods.dart';
import '../../styles/color_palette.dart';

class CarpoolPostWidget extends StatelessWidget {
  final CarpoolPost postData;
  final Language language;
  final Function _contactButtonPressed;
  const CarpoolPostWidget(
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
                    Text(
                      postData.tradeMethod.toLocalizedString(language),
                      style: TextStyle(
                        color: AppColor.secondary.color(),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: _originDestinationRow(
                        LocalizedCommunityStrings.fromToLocalized(language),
                        postData.from,
                        context,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: _originDestinationRow(
                        LocalizedCommunityStrings.destinationToLocalized(
                            language),
                        postData.to,
                        context,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: _originDestinationRow(
                        LocalizedCommunityStrings.dateTimeToLocaleString(
                            postData.postDate, language,
                            needsHrs: true),
                        "",
                        context,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
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

  Widget _originDestinationRow(
      String left, String right, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: AutoSizeText(
              "$left $right",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
