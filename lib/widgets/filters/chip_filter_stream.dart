import 'package:cityprog/strings/string_provider.dart';
import '../../current_language.dart';
import 'package:flutter/material.dart';

class StreamChipFilter extends StatelessWidget {
 
  final Function onSelected;
  final selected;
  final myQueryData;
  StreamChipFilter({this.onSelected, this.selected, this.myQueryData});

  @override
  Widget build(BuildContext context) {
          return Container( child: Wrap(
          spacing: 6.0,
          runSpacing: 6.0,
          children: List<Widget>.generate(myQueryData.length, (int index) {  
             return  FilterChip(
                label: CurrentLanguage.value == Language.FI ? Text(myQueryData[index]['nameFI'].toString()): Text(myQueryData[index]['nameEN'].toString()),
                onSelected: (bool value) {
                  onSelected(myQueryData[index]['nameEN'].toString(), selected);
                },
                selected: selected.contains(myQueryData[index]['nameEN'].toString()),
                selectedColor: Colors.blue,
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                backgroundColor: Colors.grey,
             );
          },
      ),),);
  }
}
              