import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/widgets/Inputs/community_form_input.dart';
import 'package:cityprog/widgets/buttons/submit_form_button.dart';
import 'package:cityprog/widgets/columns/title_details_column.dart';
import 'package:flutter/material.dart';

class OfferingForm extends StatelessWidget {
  final Trading method = Trading.BUYING;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TitleDetailsColumn(),
          SubmitFormButton(onPress: () => print("submit offer"),),
        ],
      ),
    );
  }
}
