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
        child: LowerSection(_buildList(context)),
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

final List<MarketPostData> posts = [post1, post2, post3, post4];

final MarketPostData post1 = MarketPostData(
    title: "Ostetaan wc paperia",
    body: "Ostetaan wc paperia 5€ rulla. Lambia kiitos",
    uid: "Metti Mäikäläinen",
    price: 5,
    tradeMethod: Trading.BUYING,
    postDate: DateTime.now());
final MarketPostData post2 = MarketPostData(
    title: "Blue stuff",
    body: "You know what I'm talking about",
    uid: "Heisenberg",
    price: 51.99,
    tradeMethod: Trading.SELLING,
    postDate: DateTime.now());
final MarketPostData post3 = MarketPostData(
    title: "Giving away stuff",
    body: "",
    uid: "Free Stuff Giver",
    tradeMethod: Trading.FREE,
    postDate: DateTime.now());
final MarketPostData post4 = MarketPostData(
    title: "Buying stuff",
    body: "Buying all the stuff. Testing a longer body text here to see how it would look...",
    uid: "Mikael",
    tradeMethod: Trading.BUYING,
    postDate: DateTime.now());
