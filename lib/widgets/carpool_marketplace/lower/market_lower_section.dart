import 'package:cityprog/model/market.dart';
import 'package:cityprog/widgets/posts/market_post.dart';
import 'package:flutter/material.dart';

import './lower_section.dart';
import '../../../model/trade_methods.dart';

class MarketLower extends StatelessWidget {
  final Function _moreButtonPressed;
  const MarketLower(this._moreButtonPressed);

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
    return MarketPostWidget(posts[position],
        () => _moreButtonPressed(posts[position]));
  }
}

final List<MarketPost> posts = [post1, post2, post3, post4];

final MarketPost post1 = MarketPost(
    title: "Ostetaan wc paperia asd asd asd asd",
    body: "Ostetaan wc paperia 5€ rulla. Lambia kiitos",
    postedBy: "Metti Mäikäläinen",
    tradeMethod: Trading.BUYING,
    postDate: DateTime.now());
final MarketPost post2 = MarketPost(
    title: "Blue stuff",
    body: "You know what I'm talking about",
    postedBy: "Heisenberg",
    tradeMethod: Trading.SELLING,
    postDate: DateTime.now());
final MarketPost post3 = MarketPost(
    title: "YOU WON!!!",
    body:
        "CONGRALUTAITON SIR!! YOU WIN METROPOLIA ANNUAL"+
        " MONY GRANT 2000,00.0000 DOLLARS!!! CONTACT AT dremcometrue@macsaton.com",
    postedBy: "Metorpolia Admin",
    tradeMethod: Trading.FREE,
    postDate: DateTime.now());
final MarketPost post4 = MarketPost(
    title: "Buying stuff",
    body: "Some body text",
    postedBy: "Mikael",
    tradeMethod: Trading.BUYING,
    postDate: DateTime.now());
