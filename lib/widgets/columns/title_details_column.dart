import 'package:cityprog/strings/community_strings.dart';
import 'package:cityprog/widgets/Inputs/community_form_input.dart';
import 'package:flutter/material.dart';

class TitleDetailsColumn extends StatelessWidget {
  const TitleDetailsColumn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        CommunityFormInput(
          maxLines: 1,
            hint: LocalizedCommunityStrings.titleToLocalized(),
            fontSize: 28,
          ),
          CommunityFormInput(
            maxLines: 5,
            hint: LocalizedCommunityStrings.detailsToLocalized(),
            fontSize: 28,
          ),
      ],)
    );
  }
}