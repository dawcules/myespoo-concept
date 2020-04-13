import 'package:cityprog/model/carpool.dart';
import 'package:cityprog/strings/community_strings.dart';
import 'package:flutter/material.dart';

class CarpoolPostModal extends StatelessWidget {
  final CarpoolPostData post;
  const CarpoolPostModal(this.post);
  static const TextStyle _style = TextStyle(
    fontSize: 28,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(post.title, style: _style),
        Padding(padding: EdgeInsets.all(8)),
        Text(post.from, style: _style),
        Padding(padding: EdgeInsets.all(8)),
        Text(post.to, style: _style),
        Padding(padding: EdgeInsets.all(8)),
        Text(post.body, style: _style),
        Padding(padding: EdgeInsets.all(8)),
        Text(post.postedBy, style: _style),
        Padding(padding: EdgeInsets.all(4)),
        Text(LocalizedCommunityStrings.dateTimeToLocaleString(post.postDate,
            needsHrs: true)),
        Padding(padding: EdgeInsets.all(16)),
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
