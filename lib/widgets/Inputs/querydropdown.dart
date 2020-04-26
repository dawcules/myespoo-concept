 
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

  QueryDropdown({this.myQueryData, this.onSelected, this.selected, this.hint});

  
   @override
  Widget build(BuildContext context) {

  return Container(
        child: DropdownButton<String>(
          value: selected,
          isExpanded: true,
          hint: AutoSizeText(
            hint,
            maxLines: 1,
            maxFontSize: 20,
            minFontSize: 10,
            overflow: TextOverflow.ellipsis,       
          ),
          
          onChanged: (newValue) => onSelected(newValue),
          items: myQueryData.map<DropdownMenuItem<String>>((DocumentSnapshot document) {
                    return DropdownMenuItem<String>(
                        value: document.data["nameEN"],
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.background.color(),
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0.0),
                          //color: AppColor.secondary.color(),
                          child: CurrentLanguage.value == Language.FI ? Text(document['nameFI'], style: TextStyle(color: AppColor.darkText.color(), fontFamily: 'RadikalLight' )) : Text(document['nameEN'],style: TextStyle(color: AppColor.darkText.color(), fontFamily: 'RadikalLight')),
                        )
                    );
                  }).toList(),
        ),
      );
  }
}