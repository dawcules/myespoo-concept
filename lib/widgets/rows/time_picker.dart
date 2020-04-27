import 'package:cityprog/strings/validation_strings.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final Function onTimePicked;
  final bool showInstructions;
  const TimePicker({this.onTimePicked, this.showInstructions});

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TextStyle style = TextStyle(fontSize: 20, color: AppColor.secondary.color(), fontWeight: FontWeight.bold);
  TimeOfDay selectedTime =
      TimeOfDay(hour: TimeOfDay.now().hour + 4, minute: TimeOfDay.now().minute);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        widget.showInstructions == null || widget.showInstructions == false
            ? Text("${selectedTime.format(context)}", style: style)
            : Text(ValidationStrings.chooseTimeToLocalized(), style: TextStyle(color: Colors.red)),
        IconButton(
          color: AppColor.secondary.color(),
          iconSize: 40,
          icon: Icon(Icons.timelapse),
          onPressed: () => _openTimePicker(context),
        ),
      ],
    ));
  }

  void _openTimePicker(BuildContext context) async {
    TimeOfDay select = await showTimePicker(
      initialTime: selectedTime,
      context: context,
    );
    if (select != null) {
      setState(() {
        selectedTime = select;
        if (widget.onTimePicked != null) {
          widget.onTimePicked(select);
        }
      });
    }
  }
}
