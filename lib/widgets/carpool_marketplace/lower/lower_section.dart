
//import 'package:cityprog/widgets/buttons/universal_button.dart';
import 'package:cityprog/widgets/buttons/universal_raised_button.dart';
import 'package:flutter/material.dart';

import '../../../styles/color_palette.dart';

class LowerSection extends StatelessWidget {
  final ListView listViewPosts;
  final Widget header;
  const LowerSection(this.listViewPosts, {this.header});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background.color(),
      child: Column(
        children: <Widget>[
          UniversalRaisedButton(onPressed: () => print("xd"),),
          header != null ? header : Padding(padding: EdgeInsets.all(0),),
          Expanded(child: listViewPosts,),
        ],
      ),
    );
  }
}
