import 'package:cityprog/model/market.dart';
import 'package:cityprog/strings/community_strings.dart';
import 'package:cityprog/strings/widget_texts.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/carpool_marketplace/textviews/localized_price.dart';
import 'package:cityprog/widgets/containers/box_with_border.dart';
import 'package:cityprog/widgets/posts/field_name_and_value.dart';
import 'package:flutter/material.dart';

class MarketPostModal extends StatelessWidget {
  final MarketPostData post;
  static const TextStyle _style = TextStyle(
    fontSize: 20,
  );
  const MarketPostModal(this.post);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Align(alignment: Alignment.centerLeft, child: _date()),
        Padding(padding: EdgeInsets.all(8),),
        _body(),
        Padding(padding: EdgeInsets.only(top: 8)),
        _price(),
        Padding(padding: EdgeInsets.only(top: 8)),
        _user(),
        Padding(padding: EdgeInsets.only(top: 8)),
        _contact(),
        Padding(padding: EdgeInsets.all(8)),
      ],
    );
  }

  Widget _body() {
    return post.body != null && post.body.isNotEmpty
        ? BoxWithBorder(
            borderRadius: 5, children: [Text(post.body, style: _style)])
        : Padding(
            padding: EdgeInsets.all(0),
          );
  }

  Widget _price() {
    return post.price != null
        ? FieldNameAndValue(
            fieldName: LocalizedWidgetStrings.priceToLocalized(),
            valueChild: LocalizedPrice(post.price),
          )
        : Padding(
            padding: EdgeInsets.all(0),
          );
  }

  Widget _user() {
    return FieldNameAndValue(
      fieldName: LocalizedWidgetStrings.postedByToLocalized(),
      valueChild: Text(post.postedBy != null ? post.postedBy : "John Doe",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColor.secondary.color())),
    );
  }

  Widget _date() {
    return Text(
      LocalizedCommunityStrings.dateTimeToLocaleString(post.postDate,
          needsHrs: true),
    );
  }

  Widget _contact() {
    return Align(
      alignment: Alignment.center,
      child: FlatButton(
        child: Text(
          LocalizedCommunityStrings.contactToLocalized(),
          style: TextStyle(fontSize: 24),
        ),
        onPressed: () => print("Contacted!!!!"),
      ),
    );
  }
}
