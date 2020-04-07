import 'package:flutter/material.dart';

import '../../strings/string_provider.dart' show Language;
import '../../strings/community_strings.dart';

// Shows a row with a Text view of the selected date
// along with a IconButton with onPress for picking a date.

class TextDateWithCalendarPicker extends StatefulWidget {
  final Language _language;
  TextDateWithCalendarPicker(this._language);

  @override
  _TextDateWithCalendarPickerState createState() =>
      _TextDateWithCalendarPickerState(_language);
}

class _TextDateWithCalendarPickerState
    extends State<TextDateWithCalendarPicker> {
  Language _language;
  DateTime _selectedDate = DateTime.now();
  DateTime _firstDate = DateTime(2020);
  DateTime _lastDate = DateTime(2021);

  _TextDateWithCalendarPickerState(Language _language);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: _calendarRow(context),
    );
  }

  Widget _calendarRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          LocalizedCommunityStrings.dateTimeToLocaleString(
              _selectedDate, _language),
          style: TextStyle(fontSize: 20),
        ),
        IconButton(
          icon: Icon(Icons.calendar_today, size: 30),
          onPressed: () => _openCalendar(context),
        )
      ],
    );
  }

  void _openCalendar(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: _firstDate,
      initialDate: _selectedDate,
      lastDate: _lastDate,
    ).then((onValue) => {
          if (onValue != null) {setState(() => _selectedDate = onValue)}
        });
  }
}
