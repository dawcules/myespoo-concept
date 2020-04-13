import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/buttons/submit_form_button.dart';
import 'package:cityprog/widgets/columns/origin_destination.dart';
import 'package:cityprog/widgets/columns/title_details_column.dart';
import 'package:flutter/material.dart';

class OfferingForm extends StatelessWidget {
  final Trading method = Trading.BUYING;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView(
        children: <Widget>[
          OriginDestinationColumn(),
          TitleDetailsColumn(),
        ],
      ),
    );
  }
}
