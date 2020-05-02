import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:cityprog/strings/community_help_strings.dart';
import 'package:cityprog/widgets/Inputs/icon_form_input.dart';
import 'package:cityprog/validation/validation.dart';
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:cityprog/widgets/database_model/auth.dart';
import 'package:cityprog/validation/title_details_validator.dart';
import 'package:cityprog/strings/validation_strings.dart';
import 'package:cityprog/widgets/buttons/submit_form_button.dart';

Validation formValidation = new Validation();

class CommunityHelpRequest extends StatefulWidget {
  @override
  _CommunityHelpRequestState createState() => _CommunityHelpRequestState();
}

class _CommunityHelpRequestState extends State<CommunityHelpRequest> {
  var dropdownValue = LocalizedCommunityHelpStrings.listToLocalized()[0];

  String _chooseRandomArea() {
    List<String> areasList = [
      "Espoonlahti",
      "Kauklahti",
      "Leppävaara",
      "Matinkylä",
      "Pohjois-Espoo",
      "Tapiola",
      "Vanha-Espoo"
    ];
    String first = (areasList..shuffle()).first;
    return first;
  }

  void _sendData(type) {
    Map<String, dynamic> toMap() => {
          'title': _titleDetailsValidator.title,
          'description': _titleDetailsValidator.details,
          'user': Auth().getUser().uid,
          'date': DateTime.now(),
          'area': _chooseRandomArea(),
          'type': type,
          'postedBy': Auth().getUser().displayName,
        };
    Database().newHelperPost(
        post: toMap(),
        document: "Receiver",
        collection: 'HelpRequest',
        callback: (value, error) => {
              if (!error)
                {
                  Navigator.of(context).pushReplacementNamed("/communityHelp")
                }
            });
  }

  final TitleDetailsValidator _titleDetailsValidator = TitleDetailsValidator();
  final key = new GlobalKey<ScaffoldState>();

  void _validate(Function callback) {
    callback(_titleDetailsValidator.validate());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: key,
        body: Center(
          child: Container(
            height: 1000,
            width: 750,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Text(
                        LocalizedCommunityHelpStrings.submitTitleToLocalized(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(20.0)),
                    IconFormInput(
                      hint: LocalizedCommunityHelpStrings.titleToLocalized(),
                      validation: _titleDetailsValidator != null
                          ? _titleDetailsValidator.validateTitle
                          : true,
                      autoValidate: true,
                      validationText: _titleDetailsValidator != null
                          ? ValidationStrings.titleErrorTextToLocalized()
                          : " ",
                      icon: Icon(Icons.title),
                      onChanged: (value) => null,
                    ),
                    IconFormInput(
                      autoValidate: true,
                      maxLines: 10,
                      hint: LocalizedCommunityHelpStrings.descToLocalized(),
                      validation: _titleDetailsValidator != null
                          ? _titleDetailsValidator.validateDetails
                          : true,
                      validationText: _titleDetailsValidator != null
                          ? ValidationStrings.descriptionErrorTextToLocalized()
                          : " ",
                      onChanged: (value) => null,
                      icon: Icon(Icons.description),
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          fontSize: 20, color: AppColor.secondary.color()),
                      underline: Container(
                        height: 2,
                        color: AppColor.secondary.color(),
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          print('VALUE' + newValue);
                          dropdownValue = newValue;
                        });
                      },
                      items: LocalizedCommunityHelpStrings.listToLocalized()
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    Container(
                      margin: EdgeInsets.all(20.0),
                      child: Text(
                          LocalizedCommunityHelpStrings
                              .requestDescToLocalized(),
                          style: TextStyle(fontSize: 20)),
                    ),
                    SubmitFormButton(
                      onPress: _validate,
                      onValidatedSuccess: () => {
                        if (dropdownValue !=
                            LocalizedCommunityHelpStrings.listToLocalized()[0])
                          {_sendData(dropdownValue)}
                        else
                          {
                            key.currentState.showSnackBar(SnackBar(
                              content: Text(LocalizedCommunityHelpStrings
                                  .snackToLocalized()),
                            ))
                          }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
