import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';
//import 'package:cityprog/strings/community_help_strings.dart';
import 'package:cityprog/widgets/Inputs/icon_form_input.dart';
import 'package:cityprog/validation/validation.dart';

Validation formValidation = new Validation();

class CommunityHelpRequest extends StatefulWidget {
  @override
  _CommunityHelpRequestState createState() => _CommunityHelpRequestState();
}

class _CommunityHelpRequestState extends State<CommunityHelpRequest> {
  var dropdownValue = 'Select category';

        // TODO: Create localized strings, send form data to FS

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 600,
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Text(
                        'TEE TEKSTI',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(20.0)),
                    IconFormInput(
                        hint: "Title",
                        validationText: "Insert a title",
                        validation: formValidation.validateText,
                        icon: Icon(Icons.title)),
                    IconFormInput(
                        hint: "Description",
                        validationText: "Insert a description",
                        validation: formValidation.validateText,
                        icon: Icon(Icons.description)),
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
                      items: ['Select category', 'Furniture', 'Store visits']
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
                          'Tee tämäkin teksti, joka kuvaksen paikkaa ajaa',
                          style: TextStyle(fontSize: 20)),
                    ),
                    RaisedButton(
                      color: AppColor.button.color(),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                        child: Text(
                          'TEE TÄHÄN NAPPITEKSTI',
                          style: TextStyle(
                            color: AppColor.buttonText.color(),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
