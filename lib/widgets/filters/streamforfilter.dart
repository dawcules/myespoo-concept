
import 'package:flutter/material.dart';

import 'chip_filter_stream.dart';

class StreamForFilter extends StatelessWidget {
  //Tähän siis sisään collection mikä näytetään

  final Function onSelected;
  final selected;
  final myQuery;

  StreamForFilter({this.onSelected, this.selected, this.myQuery});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:StreamBuilder(
          stream: myQuery,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading..');
            return StreamChipFilter(myQueryData: snapshot.data.documents, onSelected: onSelected, selected: selected,);
          }),
    );
  }
}