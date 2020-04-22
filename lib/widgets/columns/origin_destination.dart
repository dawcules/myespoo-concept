import 'package:cityprog/strings/community_strings.dart';
import 'package:cityprog/widgets/Inputs/address_picker.dart';
import 'package:flutter/material.dart';

class OriginDestinationColumn extends StatelessWidget {
  final Function onOriginPicked;
  final Function onDestinationPicked;
  const OriginDestinationColumn({this.onOriginPicked, this.onDestinationPicked});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AddressPicker(
          hintText: LocalizedCommunityStrings.fromToLocalized(),
          onAddressPicked: onOriginPicked,
        ),
        AddressPicker(
          hintText: LocalizedCommunityStrings.destinationToLocalized(),
          onAddressPicked: onDestinationPicked,
        ),
      ],
    );
  }
}
