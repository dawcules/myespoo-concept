import 'package:auto_size_text/auto_size_text.dart';
import 'package:cityprog/widgets/rows/trade_method_row.dart';
import 'package:flutter/material.dart';

import '../../model/carpool.dart';
import '../../strings/community_strings.dart';
import '../../styles/color_palette.dart';

class CarpoolPostWidget extends StatelessWidget {
  final CarpoolPostData postData;
  final Function _moreButtonPressed;
  const CarpoolPostWidget(this.postData, this._moreButtonPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 10,
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
                  flex: 3,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            _originDestinationRow(
                              LocalizedCommunityStrings.fromToLocalized(),
                              postData.origin,
                              context,
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                            ),
                            _originDestinationRow(
                              LocalizedCommunityStrings
                                  .destinationToLocalized(),
                              postData.destination,
                              context,
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: _originDestinationRow(
                                LocalizedCommunityStrings
                                    .dateTimeToLocaleString(postData.postDate,
                                        needsHrs: true),
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
                                    fontSize: 24,
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
                )
              ],
            )
          ],
        ),
      ),
    );
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
