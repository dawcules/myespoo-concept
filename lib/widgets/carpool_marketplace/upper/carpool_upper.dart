import 'package:flutter/material.dart';

import './upper_section.dart';
import '../../rows/text_date_with_calendar.dart';
import '../../../styles/color_palette.dart';

class CarpoolUpper extends StatefulWidget {
  final Function onPressedOffer;
  final Function onPressedAsk;
  final Function onPressedBrowse;
  const CarpoolUpper({
    @required this.onPressedOffer,
    @required this.onPressedAsk,
    @required this.onPressedBrowse,
  });

  @override
  _CarpoolUpperState createState() => _CarpoolUpperState();
}

class _CarpoolUpperState extends State<CarpoolUpper> {
  Color colorBackground = AppColor.background.color();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: colorBackground,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            UpperSection(
              onPressedOffer: widget.onPressedOffer,
              onPressedAsk: widget.onPressedAsk,
              onPressedBrowse: widget.onPressedBrowse,
              isCarpoolPage: true,
            ),
            TextDateWithCalendarPicker(),
          ],
        ));
  }
}
