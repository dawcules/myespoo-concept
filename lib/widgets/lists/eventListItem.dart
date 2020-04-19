import 'package:flutter/material.dart';
import 'package:cityprog/styles/color_palette.dart';
import '../database_model/database.dart';


class EventListTile extends StatelessWidget {
  final dynamic index;

  EventListTile(this.index);

  @override
 Widget build(BuildContext context) {

 return ListTile(
      title: Ink(
        color: AppColor.background.color(),
        child: Row(
        children: [
        Expanded(
            child: Text(
              index['nimi'].toString(), style: TextStyle(color: AppColor.secondary.color()),
            )),
        Container(
            decoration: BoxDecoration(color: AppColor.primary.color()),
            padding: EdgeInsets.all(10),
            child: Text(index['likes'].toString(),style: TextStyle(color: AppColor.whiteText.color()),),),
        Divider(),
      ]),),
      trailing: Icon(Icons.person_pin),
      onTap: () {
          Database().updateValue('likes', 1, index.reference); //Katso Database singleton, päivittää referenssin likeja
          //Tähän voi pistää vaikka navigoinnin ja viedä index dokkarin mukana.
      },
    );
  }
}