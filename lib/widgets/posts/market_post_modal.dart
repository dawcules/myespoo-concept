import 'package:cityprog/model/market.dart';
import 'package:cityprog/strings/community_strings.dart';
import 'package:cityprog/widgets/carpool_marketplace/textviews/localized_price.dart';
import 'package:flutter/material.dart';

class MarketPostModal extends StatelessWidget {
  final MarketPostData post;
  static const TextStyle _style = TextStyle(
    fontSize: 28,
  );
  const MarketPostModal(this.post);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(post.title,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            )),
        Padding(padding: EdgeInsets.only(top: 8)),
        post.body != null && post.body.isNotEmpty
            ? Text(post.body, style: _style)
            : Padding(
                padding: EdgeInsets.all(0),
              ),
        Padding(padding: EdgeInsets.only(top: 8)),
        post.price != null
            ? LocalizedPrice(post.price)
            : Padding(
                padding: EdgeInsets.all(0),
              ),
        Padding(padding: EdgeInsets.only(top: 8)),
        Text(post.postedBy, style: _style),
        Padding(
          padding: EdgeInsets.only(top: 8),
        ),
        Text(
          LocalizedCommunityStrings.dateTimeToLocaleString(post.postDate,
              needsHrs: true),
        ),
        Padding(padding: EdgeInsets.only(top: 8)),
        Align(
          alignment: Alignment.center,
          child: FlatButton(
            child: Text(
              LocalizedCommunityStrings.contactToLocalized(),
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () => print("Contacted!!!!"),
          ),
        ),
        Padding(padding: EdgeInsets.all(8)),
      ],
    );
  }
}
