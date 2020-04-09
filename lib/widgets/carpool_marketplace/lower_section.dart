import 'package:flutter/material.dart';

class LowerSection extends StatelessWidget {
  final ListView listViewPosts;
  const LowerSection(this.listViewPosts);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Column(
        children: <Widget>[
          Expanded(child: listViewPosts),
        ],
      ),
    );
  }
}
