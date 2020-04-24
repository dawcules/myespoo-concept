import 'dart:io';

import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/validation/title_details_validator.dart';
import 'package:cityprog/widgets/buttons/submit_form_button.dart';
import 'package:cityprog/widgets/camera/app_image_picker.dart';
import 'package:cityprog/widgets/columns/title_details_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SellingForm extends StatefulWidget {
  @override
  _SellingFormState createState() => _SellingFormState();
}

class _SellingFormState extends State<SellingForm> {
  final Trading method = Trading.SELLING;
  final TitleDetailsValidator _validator = TitleDetailsValidator();

  double price;

  File _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // TODO: tuduuuuuu
          TextFormField(
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          TitleDetailsColumn(
            validator: _validator,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppImagePicker(
              iconSize: 40,
              onImagePicked: (File img) => _onImagePicked(img),
            ),
          ),
          SubmitFormButton(
            onPress: _validate,
            onValidatedSuccess: () => _submitPost(),
          )
        ],
      ),
    );
  }

  void _onImagePicked(File img) {
    setState(() => _image = img);
  }

  void _validate(Function callback) {
    callback(_validator.validate());
  }

  void _submitPost() {
    print("submitted da sell post!");
    if (_image != null) {
      print(_image);
    }
    print(_validator.title);
    print(_validator.details);
  }
}
