import 'package:cityprog/model/carpool.dart';
import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/strings/widget_texts.dart';
import 'package:cityprog/validation/origin_destination_validator.dart';
import 'package:cityprog/widgets/buttons/submit_form_button.dart';
import 'package:cityprog/widgets/carpool_marketplace/forms/custom_expansion_tile.dart';
import 'package:cityprog/widgets/columns/origin_destination.dart';
import 'package:cityprog/widgets/columns/title_details_column.dart';
import 'package:cityprog/widgets/database_model/auth.dart';
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:cityprog/widgets/dialogs/citizenpoint_update.dart';
import 'package:cityprog/widgets/rows/text_date_with_calendar.dart';
import 'package:cityprog/widgets/rows/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class CarpoolForm extends StatefulWidget {
  final Trading method;
  CarpoolForm(this.method);

  @override
  _CarpoolFormState createState() => _CarpoolFormState();
}

class _CarpoolFormState extends State<CarpoolForm> {
  bool _dateWasPicked = false;
  bool _timeWasPicked = false;
  bool dateNeedsToReDraw = false;
  DateTime _selectedDate;
  TimeOfDay _selectedTime;
  String _destination;
  String _origin;
  String _title;
  String _body;
  OriginDestinationValidator validator;
  GlobalKey<TextDateWithCalendarPickerState> calendarKey =
      GlobalKey<TextDateWithCalendarPickerState>();

  @override
  void initState() {
    super.initState();
    validator = OriginDestinationValidator();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CustomExpansionTile(
            leading: Icon(Icons.notification_important),
            initiallyExpanded: true,
            title: Text(LocalizedWidgetStrings.mandatoryToLocalized()),
            children: <Widget>[
              OriginDestinationColumn(
                onDestinationPicked: (String address) =>
                    _onDestinationPicked(address),
                onOriginPicked: (String address) => _onOriginPicked(address),
              ),
              TextDateWithCalendarPicker(
                key: calendarKey,
                onDatePicked: (DateTime date) => _onDatePicked(date),
                alignment: MainAxisAlignment.end,
                textIsInstructions: !_dateWasPicked,
                initialDate: _selectedDate ?? DateTime.now(),
              ),
              TimePicker(
                onTimePicked: (TimeOfDay time) => _onTimePicked(time),
                showInstructions: !_timeWasPicked,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8),
          ),
          CustomExpansionTile(
            onExpansionChanged: (value) => print(value),
            leading: Icon(Icons.more),
            title: Text(LocalizedWidgetStrings.additionalToLocalized()),
            children: <Widget>[
              TitleDetailsColumn(
                autoValidate: false,
                onChangedDetails: (String value) => _onBodyChanged(value),
                onChangedTitle: (String value) => _onTitleChanged(value),
              )
            ],
          ),
          SubmitFormButton(
            onPress: _validate,
            onValidatedSuccess: () => _submitPost(context),
          )
        ],
      ),
    );
  }

  Widget reDrawDate() {
    //setState(() => dateNeedsToReDraw = false);
    return TextDateWithCalendarPicker(
      onDatePicked: (DateTime date) => _onDatePicked(date),
      alignment: MainAxisAlignment.end,
      textIsInstructions: !_dateWasPicked,
      initialDate: _selectedDate,
    );
  }

  void _onTitleChanged(String value) {
    setState(() {
      _title = value;
    });
  }

  void _onBodyChanged(String value) {
    setState(() {
      _body = value;
    });
  }

  void _onDatePicked(DateTime date) {
    print("Date: $date picked");
    _selectedDate = date;
    if (!_dateWasPicked) {
      setState(() => _dateWasPicked = true);
    }
    _combineDateAndTime();
  }

  void _combineDateAndTime() {
    print(
        "Selected date hour:${_selectedDate.hour}, Selected date minute:${_selectedDate.minute}");
    if (_selectedDate != null && _selectedTime != null) {
      DateTime now = DateTime.now();
      setState(() {
        // Increment selected day if it's the same day and selected time is in the past
        print(_selectedDate.day == now.day);
        print(_selectedDate.month == now.month);
        if (_selectedDate.day == now.day && _selectedDate.month == now.month) {
          if ((_selectedTime.hour == now.hour &&
                  _selectedTime.minute < now.minute) ||
              _selectedTime.hour < now.hour) {
            _selectedDate = DateTime(
                _selectedDate.year, _selectedDate.month, _selectedDate.day + 1);
            dateNeedsToReDraw = true;
            calendarKey.currentState.setState(() {
              calendarKey.currentState.selectedDate = _selectedDate;
            });
          }
        }
        DateTime date = DateTime(_selectedDate.year, _selectedDate.month,
            _selectedDate.day, _selectedTime.hour, _selectedTime.minute);
        _selectedDate = date;
        print(_selectedDate);
      });
    }
  }

  void _onTimePicked(TimeOfDay time) {
    print(time);
    _selectedTime = time;
    if (!_timeWasPicked) {
      setState(() {
        _timeWasPicked = true;
      });
    }
    _combineDateAndTime();
  }

  void _onDestinationPicked(String address) {
    validator.destinationSelected = true;
    print(address);
    _destination = address;
  }

  void _onOriginPicked(String address) {
    validator.originSelected = true;
    print(address);
    _origin = address;
  }

  void _validate(Function callback) {
    callback(validator.validate() && _timeWasPicked && _dateWasPicked);
  }

  void _submitPost(BuildContext context) async {
    CarpoolPostData post = CarpoolPostData(
        uid: Auth().getUID(),
        postedBy: Auth().getUser().displayName,
        body: _body,
        title: _title,
        origin: _origin,
        postDate: DateTime.now(),
        destination: _destination,
        timeOfDay: _selectedTime,
        date: _selectedDate,
        tradeMethod: widget.method);

    String dbCollection = widget.method.toDatabaseCollectionId();
    Database().newCommunityPost(
        document: "Carpool",
        post: post.toMap(context: context),
        collection: dbCollection,
        callback: (onValue, error) => {
              if (!error)
                if (!error)
                  {
                    showDialog(
                      context: context,
                      child: CitizenPointUpdateDialog(
                        amount: 200,
                      ),
                    ),
                    Navigator.of(context).pushReplacementNamed("/carpool")
                  }
                else
                  Toast.show("Error creating carpool post", context,
                      duration: Toast.LENGTH_LONG)
            });
  }
}
