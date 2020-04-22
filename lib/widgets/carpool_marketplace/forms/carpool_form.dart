import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/validation/origin_destination_validator.dart';
import 'package:cityprog/widgets/buttons/submit_form_button.dart';
import 'package:cityprog/widgets/columns/origin_destination.dart';
import 'package:cityprog/widgets/columns/title_details_column.dart';
import 'package:cityprog/widgets/rows/text_date_with_calendar.dart';
import 'package:cityprog/widgets/rows/time_picker.dart';
import 'package:flutter/material.dart';

class CarpoolForm extends StatefulWidget {
  final Trading method;
  CarpoolForm(this.method);

  @override
  _CarpoolFormState createState() => _CarpoolFormState();
}

class _CarpoolFormState extends State<CarpoolForm> {
  DateTime selectedDate;
  TimeOfDay selectedTime;
  bool dateWasPicked = false;
  bool timeWasPicked = false;
  bool dateNeedsToReDraw = false;
  // TODO: dateNeedsToReDraw implementation, Pakolliset, Lisätietoja etc.
  final OriginDestinationValidator validator = OriginDestinationValidator();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Align(alignment: Alignment.centerRight, child: FlatButton(child: Text("Pakolliset")),),
          OriginDestinationColumn(
            onDestinationPicked: (String address) =>
                _onDestinationPicked(address),
            onOriginPicked: (String address) => _onOriginPicked(address),
          ),
          TextDateWithCalendarPicker(
            onDatePicked: (DateTime date) => _onDatePicked(date),
            alignment: MainAxisAlignment.end,
            textIsInstructions: !dateWasPicked,
          ),
          TimePicker(
            onTimePicked: (TimeOfDay time) => _onTimePicked(time),
            showInstructions: !timeWasPicked,
          ),
          Padding(padding: EdgeInsets.all(8),),
          Align(alignment: Alignment.centerRight, child: FlatButton(child: Text("Lisätietoja")),),
          TitleDetailsColumn(),
          SubmitFormButton(
            onPress: _validate,
            onValidatedSuccess: () => _submitPost(),
          )
        ],
      ),
    );
  }

  void _onDatePicked(DateTime date) {
    print("Date: $date picked");
    selectedDate = date;
    if (!dateWasPicked) {
      setState(() => dateWasPicked = true);
    }
  }

  void _onTimePicked(TimeOfDay time) {
    print(time);
    selectedTime = time;
    if (!timeWasPicked) {
      setState(() {
        timeWasPicked = true;
      });
    }
  }

  void _onDestinationPicked(String address) {
    validator.destinationSelected = true;
    print(address);
  }

  void _onOriginPicked(String address) {
    validator.originSelected = true;
    print(address);
  }

  void _validate(Function callback) {
    callback(validator.validate() && timeWasPicked && dateWasPicked);
  }

  _submitPost() {
    print("asking submitted");
  }
}
