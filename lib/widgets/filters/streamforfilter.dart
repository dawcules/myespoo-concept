
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:flutter/material.dart';

import 'chip_filter_stream.dart';

class StreamForFilter extends StatelessWidget {
  //Tähän siis sisään collection mikä näytetään

  final Function onSelected;
  final selected;
  final String myQuery;

  StreamForFilter({this.onSelected, this.selected, this.myQuery});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:StreamBuilder(
          stream: Database().getCollection(myQuery),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading..');
            return StreamChipFilter(myQueryData: snapshot.data.documents, onSelected: onSelected, selected: selected,);
          }),
    );
  }
}