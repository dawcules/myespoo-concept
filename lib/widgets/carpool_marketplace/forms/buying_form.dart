import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/widgets/columns/title_details_column.dart';
import 'package:flutter/material.dart';

class BuyingForm extends StatelessWidget {
  final Trading method = Trading.BUYING;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: <Widget>[
          TitleDetailsColumn(),
        ],
      ),
    );
  }
}
