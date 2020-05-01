import 'package:cityprog/model/market.dart';
import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/validation/title_details_validator.dart';
import 'package:cityprog/widgets/buttons/submit_form_button.dart';
import 'package:cityprog/widgets/columns/select_price_column.dart';
import 'package:cityprog/widgets/columns/title_details_column.dart';
import 'package:cityprog/widgets/database_model/auth.dart';
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:flutter/material.dart';

class BuyingForm extends StatefulWidget {
  @override
  _BuyingFormState createState() => _BuyingFormState();
}

class _BuyingFormState extends State<BuyingForm> {
  Trading _method;
  double _price;
  final TitleDetailsValidator _titleDetailsValidator = TitleDetailsValidator();

  @override
  void initState() {
    super.initState();
    _method = Trading.BUYING;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SelectPriceColumn(
            tradeMethod: _method,
            onTradeMethodChanged: (Trading method) =>
                _onTradeMethodChanged(method),
            onPriceChanged: (double value) => _onPriceChanged(value),
          ),
          TitleDetailsColumn(
            validator: _titleDetailsValidator,
          ),
          SubmitFormButton(
            onPress: _validate,
            onValidatedSuccess: () => _submitPost(),
          )
        ],
      ),
    );
  }

  void _onPriceChanged(double price) {
    print(price);
    setState(() {
      _price = price;
    });
  }

  void _onTradeMethodChanged(Trading method) {
    print(method);
    _method = method;
  }

  void _validate(Function callback) {
    // more validation logic here
    callback(_titleDetailsValidator.validate() && _validatePrice());
  }

  bool _validatePrice() {
    if (_method == Trading.BUYING) {
      return _price != null ? true : false;
    } else
      return true;
  }

  void _submitPost() {
    print("Submit buy post!");
    MarketPostData post = MarketPostData(
        body: _titleDetailsValidator.details,
        postDate: DateTime.now(),
        uid: Auth().getUID(),
        postedBy: Auth().getUser().displayName,
        price: _price,
        title: _titleDetailsValidator.title,
        tradeMethod: _method);
    Database().newCommunityPost(
        post: post.toMap(),
        document: "Marketplace",
        collection: _method.toDatabaseCollectionId(),
        callback: (value, error) => {
              if (!error)
                {Navigator.of(context).pushReplacementNamed("/market")}
            });
  }
}
