import 'package:flutter/material.dart';

import '../../../model/carpool.dart';
import '../../posts/carpool_post.dart';
import './lower_section.dart';
import '../../../model/trade_methods.dart';

class CarpoolLower extends StatelessWidget {
  final Function _moreButtonPressed;
  const CarpoolLower(this._moreButtonPressed);

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
    return CarpoolPostWidget(posts[position],
        () => _moreButtonPressed(posts[position]));
  }
}

final List<CarpoolPostData> posts = [post1, post2, post3, post4];

final CarpoolPostData post1 = CarpoolPostData(
    title: "Tarjotaan kyytiä",
    body: "Tarjotaan kyytiä Lohjalle",
    postedBy: "Mikael",
    from: "Espoo",
    to: "Lohja",
    tradeMethod: Trading.OFFERING,
    postDate: DateTime.now());
final CarpoolPostData post2 = CarpoolPostData(
    title: "Tarjotaan kyytiä Tampereelle",
    body: "Some body text",
    postedBy: "Mikael",
    from: "Espoo",
    to: "Tampere",
    tradeMethod: Trading.OFFERING,
    postDate: DateTime.now());
final CarpoolPostData post3 = CarpoolPostData(
    title: "Tarvitsisin kyydin töihin",
    body: "Some body text",
    postedBy: "Mikael",
    from: "Koronakatu",
    to: "Metropolian osote",
    tradeMethod: Trading.ASKING,
    postDate: DateTime.now());
final CarpoolPostData post4 = CarpoolPostData(
    title: "Olisiko kyytiä Helsingin keskustaan huomiseksi?",
    body: "Some body text",
    postedBy: "Mikael",
    from: "Koronakatu",
    to: "Helsingin keskusta",
    tradeMethod: Trading.ASKING,
    postDate: DateTime.now());
