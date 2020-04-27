import 'package:cityprog/strings/community_strings.dart';
import 'package:cityprog/strings/validation_strings.dart';
import 'package:cityprog/validation/title_details_validator.dart';
import 'package:cityprog/widgets/Inputs/icon_form_input.dart';
import 'package:flutter/material.dart';

class TitleDetailsColumn extends StatelessWidget {
  final TitleDetailsValidator validator;

  const TitleDetailsColumn({this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconFormInput(
          hint: LocalizedCommunityStrings.titleToLocalized(),
          validation: validator != null ? validator.validateTitle : noValidation,
          validationText: validator != null ? ValidationStrings.titleErrorTextToLocalized() : " ",
          icon: Icon(Icons.title),
        ),
        IconFormInput(
          hint: LocalizedCommunityStrings.detailsToLocalized(),
          validation: validator != null ? validator.validateDetails : noValidation,
          validationText: validator != null ? ValidationStrings.descriptionErrorTextToLocalized() : " ",
          icon: Icon(Icons.description),
        ),
      ],
    );
  }

  bool noValidation(String value) {
    return true;
  }
}
