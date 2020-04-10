import 'package:flutter/material.dart';

import '../../styles/color_palette.dart';

class LowerSection extends StatelessWidget {
  final ListView listViewPosts;
  const LowerSection(this.listViewPosts);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background.color(),
      child: Column(
        children: <Widget>[
          Expanded(child: listViewPosts),
        ],
      ),
    );
  }
}
