import 'package:flutter/material.dart';

import '../../model/carpool.dart';
import '../posts/carpool_post.dart';
import '../../strings/string_provider.dart' show Language;
import './lower_section.dart';
import '../../model/trade_methods.dart';

class CarpoolLower extends StatelessWidget {
  final Language _language;
  final Function _contactButtonPressed;
  const CarpoolLower(this._language, this._contactButtonPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: SizedBox(
          child: LowerSection(_buildList(context)),
        ),
      ),
    );
  }

  ListView _buildList(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int position) {
        return Padding(
          padding: EdgeInsets.all(8),
          child: _getRow(position, context),
        );
      },
    );
  }

  Widget _getRow(int position, BuildContext context) {
    return CarpoolPostWidget(posts[position], _language, () => _contactButtonPressed(position));
  }
}

final List<CarpoolPost> posts = [post1, post2, post3, post4];

final CarpoolPost post1 = CarpoolPost(
    title: "Tarjotaan kyytiä",
    body: "Ei flat earthereita kiitos",
    postedBy: "Mikael",
    from: "Koronakatu",
    to: "Metropolian osote",
    tradeMethod: Trading.OFFERING,
    postDate: DateTime.now());
final CarpoolPost post2 = CarpoolPost(
    title: "I can show you the world",
    body: "Some body text",
    postedBy: "Mikael",
    from: "Koronakatu",
    to: "Metropolian osote",
    tradeMethod: Trading.OFFERING,
    postDate: DateTime.now());
final CarpoolPost post3 = CarpoolPost(
    title: "Shining",
    body: "Some body text",
    postedBy: "Mikael",
    from: "Koronakatu",
    to: "Metropolian osote",
    tradeMethod: Trading.ASKING,
    postDate: DateTime.now());
final CarpoolPost post4 = CarpoolPost(
    title: "Shimmering",
    body: "Some body text",
    postedBy: "Mikael",
    from: "Koronakatu",
    to: "Metropolian osote",
    tradeMethod: Trading.ASKING,
    postDate: DateTime.now());
