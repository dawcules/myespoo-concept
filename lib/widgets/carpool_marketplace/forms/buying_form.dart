import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/validation/title_details_validator.dart';
import 'package:cityprog/widgets/buttons/submit_form_button.dart';
import 'package:cityprog/widgets/columns/title_details_column.dart';
import 'package:flutter/material.dart';

class BuyingForm extends StatefulWidget {
  @override
  _BuyingFormState createState() => _BuyingFormState();
}

class _BuyingFormState extends State<BuyingForm> {
  final Trading method = Trading.BUYING;
  final TitleDetailsValidator titleDetailsValidator = TitleDetailsValidator();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TitleDetailsColumn(
            validator: titleDetailsValidator,
          ),
          SubmitFormButton(
            onPress: _validate,
            onValidatedSuccess: () => _submitPost(),
          )
        ],
      ),
    );
  }

  void _validate(Function callback) {
    // more validation logic here
    callback(titleDetailsValidator.validate());
  }

  void _submitPost() {
    print("submitted da buy post!");
  }
}
