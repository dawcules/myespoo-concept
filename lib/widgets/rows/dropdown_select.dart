import 'package:flutter/material.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/strings/community_help_strings.dart';

class DropdownSelect extends StatefulWidget {
  final List<String> _optionList;
  final GlobalKey<ScaffoldState> _key;
  final String _route;

  DropdownSelect(this._optionList, this._key, this._route);

  @override
  _DropdownSelectState createState() => _DropdownSelectState();
}

class _DropdownSelectState extends State<DropdownSelect> {

  String dropdownValue;

  @override
  void initState() {
    dropdownValue = widget._optionList.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> key = widget._key;
    return Container(
      child: Column(
        children: <Widget>[
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style:
                    TextStyle(fontSize: 16, color: AppColor.secondary.color()),
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
                items: widget._optionList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              FlatButton(
                child: Text(
                  LocalizedCommunityHelpStrings.catBtnToLocalized(),
                  style: TextStyle(color: AppColor.whiteText.color()),
                ),
                color: AppColor.primary.color(),
                onPressed: () => {
                  if (dropdownValue != widget._optionList.first)
                    Navigator.of(context).pushNamed(widget._route, arguments: dropdownValue)
                  else
                    {
                      key.currentState.showSnackBar(SnackBar(
                        content: Text(LocalizedCommunityHelpStrings.snackToLocalized()),
                      ))
                    }
                },
              )
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}