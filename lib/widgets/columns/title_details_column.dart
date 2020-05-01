import 'package:cityprog/strings/community_strings.dart';
import 'package:cityprog/strings/validation_strings.dart';
import 'package:cityprog/validation/title_details_validator.dart';
import 'package:cityprog/widgets/Inputs/icon_form_input.dart';
import 'package:flutter/material.dart';

class TitleDetailsColumn extends StatelessWidget {
  final TitleDetailsValidator validator;
  final bool autoValidate;
  final Function onChangedTitle;
  final Function onChangedDetails;

  const TitleDetailsColumn({this.validator, this.autoValidate = true, this.onChangedDetails, this.onChangedTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconFormInput(
            hint: LocalizedCommunityStrings.titleToLocalized(),
            validation: validator != null ? validator.validateTitle : noValidation,
            autoValidate: autoValidate,
            validationText: validator != null ? ValidationStrings.titleErrorTextToLocalized() : " ",
            icon: Icon(Icons.title),
            onChanged: (value) => onChangedTitle != null ? onChangedTitle(value) : null,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconFormInput(
            autoValidate: autoValidate,
            maxLines: 10,
            hint: LocalizedCommunityStrings.detailsToLocalized(),
            validation: validator != null ? validator.validateDetails : noValidation,
            validationText: validator != null ? ValidationStrings.descriptionErrorTextToLocalized() : " ",
            onChanged: (value) => onChangedDetails != null ? onChangedDetails(value) : null,
            icon: Icon(Icons.description),
          ),
        ),
      ],
    );
  }

  bool noValidation(String value) {
    return true;
  }
}
