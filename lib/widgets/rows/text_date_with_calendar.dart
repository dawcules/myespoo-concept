import 'package:flutter/material.dart';

import '../../strings/community_strings.dart';
import '../../styles/color_palette.dart';

// Shows a row with a Text view of the selected date
// along with a IconButton with onPress for picking a date.

class TextDateWithCalendarPicker extends StatefulWidget {
  TextDateWithCalendarPicker();

  @override
  _TextDateWithCalendarPickerState createState() =>
      _TextDateWithCalendarPickerState();
}

class _TextDateWithCalendarPickerState
    extends State<TextDateWithCalendarPicker> {

  DateTime _selectedDate = DateTime.now();
  DateTime _firstDate = DateTime(2020);
  DateTime _lastDate = DateTime(2021);

  _TextDateWithCalendarPickerState();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background.color(),
      child: _calendarRow(context),
    );
  }

  Widget _calendarRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          LocalizedCommunityStrings.dateTimeToLocaleString(
              _selectedDate),
          style: TextStyle(
            fontSize: 20,
            color: AppColor.secondary.color(),
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.calendar_today,
            size: 30,
            color: AppColor.button.color(),
          ),
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
