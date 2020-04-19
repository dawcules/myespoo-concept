import 'package:cityprog/strings/community_strings.dart';
import 'package:cityprog/widgets/Inputs/address_picker.dart';
import 'package:flutter/material.dart';

class OriginDestinationColumn extends StatelessWidget {
  const OriginDestinationColumn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AddressPicker(
          hintText: LocalizedCommunityStrings.fromToLocalized(),
        ),
        AddressPicker(
          hintText: LocalizedCommunityStrings.destinationToLocalized(),
        ),
      ],
    );
  }
}
