import 'package:cityprog/strings/community_strings.dart';
import 'package:flutter/material.dart';

import './upper_section.dart';
import '../rows/text_date_with_calendar.dart';
import '../../strings/string_provider.dart' show Language;

class CarpoolUpper extends StatefulWidget {
  final Language language;
  final Function onPressedOffer;
  final Function onPressedAsk;
  final Function onPressedBrowse;
  const CarpoolUpper({
    @required this.language,
    @required this.onPressedOffer,
    @required this.onPressedAsk,
    @required this.onPressedBrowse,
  });

  @override
  _CarpoolUpperState createState() => _CarpoolUpperState(language);
}

class _CarpoolUpperState extends State<CarpoolUpper> {
  Language _language;

  _CarpoolUpperState(Language _language);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            UpperSection(
              language: widget.language,
              onPressedOffer: widget.onPressedOffer,
              onPressedAsk: widget.onPressedAsk,
              onPressedBrowse: widget.onPressedBrowse,
              isCarpoolPage: true,
            ),
            TextDateWithCalendarPicker(_language),
          ],
        ));
  }
}
