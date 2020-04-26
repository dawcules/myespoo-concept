import 'package:cityprog/widgets/Inputs/querydropdown.dart';
import 'package:flutter/material.dart';

class DropDownStream extends StatelessWidget {
  //Tähän siis sisään collection mikä näytetään
  final hint;
  final Function onSelected;
  final selected;
  final myQuery;

  DropDownStream({this.onSelected, this.selected, this.myQuery, this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:StreamBuilder(
          stream: myQuery,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading..');
            return QueryDropdown(myQueryData: snapshot.data.documents, onSelected: onSelected, selected: selected, hint: hint);
          }),
    );
  }
}