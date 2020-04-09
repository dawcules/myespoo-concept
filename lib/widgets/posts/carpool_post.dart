import 'package:flutter/material.dart';

import '../../model/carpool.dart';
import '../../strings/community_strings.dart';
import '../../strings/string_provider.dart' show Language;
import '../../model/trade_methods.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              postData.tradeMethod.toLocalizedString(language),
              style: TextStyle(color: Colors.red, fontSize: 28),
            ),
            Text(
              "${LocalizedCommunityStrings.fromToLocalized(language)}: ${postData.from}",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "${LocalizedCommunityStrings.destinationToLocalized(language)}: ${postData.to}",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              LocalizedCommunityStrings.dateTimeToLocaleString(
                  postData.postDate, language),
            ),
            Align(
              alignment: Alignment.center,
              child: FlatButton(
                child: Text(
                    LocalizedCommunityStrings.contactToLocalized(language)),
                onPressed: () => _contactButtonPressed(),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
