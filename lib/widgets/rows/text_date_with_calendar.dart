import 'package:cityprog/strings/validation_strings.dart';
import 'package:flutter/material.dart';

import '../../strings/community_strings.dart';
import '../../styles/color_palette.dart';

// Shows a row with a Text view of the selected date
// along with a IconButton with onPress for picking a date.

class TextDateWithCalendarPicker extends StatefulWidget {
  final Function onDatePicked;
  final MainAxisAlignment alignment;
  final bool textIsInstructions;
  TextDateWithCalendarPicker(
      {this.onDatePicked, this.alignment, this.textIsInstructions});

  @override
  _TextDateWithCalendarPickerState createState() =>
      _TextDateWithCalendarPickerState();
}

class _TextDateWithCalendarPickerState
    extends State<TextDateWithCalendarPicker> {
  DateTime _firstDate = DateTime.now().subtract(Duration(days: 1));
  DateTime _selectedDate = DateTime.now();
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
      mainAxisAlignment: widget.alignment ?? MainAxisAlignment.center,
      children: <Widget>[
        widget.textIsInstructions == null ||
                widget.textIsInstructions == false
            ? Text(
                LocalizedCommunityStrings.dateTimeToLocaleString(_selectedDate),
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.secondary.color(),
                  fontWeight: FontWeight.bold,
                ),
              )
            : Text(ValidationStrings.chooseDateToLocalized(), style: TextStyle(color: Colors.red),),
        IconButton(
          iconSize: 40,
          icon: Icon(
            Icons.calendar_today,
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
    ).then(
      (onValue) => {
        if (onValue != null)
          {
            setState(() => _selectedDate = onValue),
            if (widget.onDatePicked != null){
              widget.onDatePicked(_selectedDate),
              }
          }
      },
    );
  }
}
