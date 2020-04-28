import 'package:cityprog/widgets/buttons/universal_raised_button.dart';
import 'package:flutter/material.dart';

import './upper_section.dart';
import '../../rows/text_date_with_calendar.dart';
import '../../../styles/color_palette.dart';

class CarpoolUpper extends StatefulWidget {
  final Function onPressedOffer;
  final Function onPressedAsk;
  final Function onPressedBrowse;
  final bool isBrowing;
  const CarpoolUpper({
    @required this.onPressedOffer,
    @required this.onPressedAsk,
    @required this.onPressedBrowse,
    @required this.isBrowing,
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
            widget.isBrowing != null && widget.isBrowing
                ? TextDateWithCalendarPicker(onDatePicked: (DateTime date) => _onDatePicked(date),)
                : Padding(
                    padding: EdgeInsets.all(0),
                  ),
          ],
        ));
  }

  void _onDatePicked(DateTime date) {
    print("Sorting by date not implemented in carpool_upper.dart");
    print("Picked Date: $date");
  }
}
