 
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cityprog/current_language.dart';
import 'package:cityprog/strings/string_provider.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QueryDropdown extends StatelessWidget {

  final hint;
  final myQueryData;
  final onSelected;
  final selected;
  final icon;

  QueryDropdown({this.myQueryData, this.onSelected, this.selected, this.hint, this.icon});

  
   @override
  Widget build(BuildContext context) {

  return
    Center(child:Container(
          child: DropdownButton<String>(
          value: selected,
          isExpanded: false,
          hint:Text(
            hint,
            style: TextStyle(color: AppColor.hint.color()) ,   
          ),
          onChanged: (newValue) => onSelected(newValue),
          items: myQueryData.map<DropdownMenuItem<String>>((DocumentSnapshot document) {
                    return DropdownMenuItem<String>(
                        value: document.data["nameEN"],
                        child: Container(
                          padding: EdgeInsets.all(10),
                          //color: AppColor.secondary.color(),
                          child: CurrentLanguage.value == Language.FI ? Text(document['nameFI'], style: TextStyle(color: AppColor.secondary.color(), fontFamily: 'RadikalLight', fontWeight: FontWeight.bold, fontSize: 20 )) : Text(document['nameEN'],style: TextStyle(color: AppColor.secondary.color(), fontFamily: 'RadikalLight', fontSize: 20 )),
                        )
                    );
                  }).toList(),
        ),
    ),
        );
  }
}