import 'package:cityprog/strings/community_strings.dart';
import 'package:cityprog/widgets/Inputs/community_form_input.dart';
import 'package:flutter/material.dart';

class OriginDestinationColumn extends StatelessWidget {
  const OriginDestinationColumn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CommunityFormInput(
          maxLines: 1,
          hint: LocalizedCommunityStrings.fromToLocalized(),
          fontSize: 28,
        ),
        CommunityFormInput(
          maxLines: 1,
          hint: LocalizedCommunityStrings.destinationToLocalized(),
          fontSize: 28,
        ),
      ],
    );
  }
}
