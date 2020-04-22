import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/validation/title_details_validator.dart';
import 'package:cityprog/widgets/buttons/submit_form_button.dart';
import 'package:cityprog/widgets/camera/app_image_picker.dart';
import 'package:cityprog/widgets/columns/title_details_column.dart';
import 'package:flutter/material.dart';

class SellingForm extends StatefulWidget {
  @override
  _SellingFormState createState() => _SellingFormState();
}

class _SellingFormState extends State<SellingForm> {
  final Trading method = Trading.SELLING;

  final TitleDetailsValidator titleDetailsValidator = TitleDetailsValidator();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TitleDetailsColumn(
            validator: titleDetailsValidator,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppImagePicker(iconSize: 40,),
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
    callback(titleDetailsValidator.validate() && true && true);
  }

  void _submitPost() {
    print("submitted da sell post!");
  }
}
