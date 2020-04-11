import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/widgets/carpool_marketplace/forms/asking_form.dart';
import 'package:cityprog/widgets/carpool_marketplace/forms/buying_form.dart';
import 'package:cityprog/widgets/carpool_marketplace/forms/offering_form.dart';
import 'package:cityprog/widgets/carpool_marketplace/forms/selling_form.dart';
import 'package:flutter/material.dart';

class CommunityForm extends StatelessWidget {
  final Trading tradeMethod;
  CommunityForm(this.tradeMethod);

  @override
  Widget build(BuildContext context) {
    switch (tradeMethod) {
      case Trading.BUYING:
        return BuyingForm();
        break;
      case Trading.SELLING:
        return SellingForm();
        break;
      case Trading.FREE:
        return SellingForm();
        break;
      case Trading.ASKING:
        return AskingForm();
        break;
      case Trading.OFFERING:
        return OfferingForm();
        break;
      default:
        return Text("404............");
        break;
    }
  }

  Widget _chooseForm() {
    switch (tradeMethod) {
      case Trading.BUYING:
        return BuyingForm();
        break;
      case Trading.SELLING:
        return SellingForm();
        break;
      case Trading.FREE:
        return SellingForm();
        break;
      case Trading.ASKING:
        return AskingForm();
        break;
      case Trading.OFFERING:
        return OfferingForm();
        break;
      default:
        return Text("404............");
        break;
    }
  }
}


