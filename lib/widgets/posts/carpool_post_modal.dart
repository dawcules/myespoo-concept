import 'package:cityprog/model/carpool.dart';
import 'package:cityprog/strings/community_strings.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/containers/box_with_border.dart';
import 'package:cityprog/widgets/posts/field_name_and_value.dart';
import 'package:flutter/material.dart';

class CarpoolPostModal extends StatelessWidget {
  final CarpoolPostData post;
  const CarpoolPostModal(this.post);
  static const TextStyle _style = TextStyle(
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8),
        ),
        BoxWithBorder(
          borderRadius: 5,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(8)),
            _originDestination(),
            Padding(padding: EdgeInsets.all(8)),
            _body(),
            Padding(padding: EdgeInsets.all(8)),
            _date(),
            Padding(padding: EdgeInsets.all(8)),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(8),
        ),

        Align(alignment: Alignment.centerLeft, child: _user()),
        Padding(padding: EdgeInsets.all(4)),
        // _date(),
        // Padding(padding: EdgeInsets.all(16)),
        _contactButton(context),
        Padding(padding: EdgeInsets.all(8)),
      ],
    );
  }

  Widget _date() {
    return Text(LocalizedCommunityStrings.dateTimeToLocaleString(post.postDate,
        needsHrs: true));
  }

  Widget _body() {
    return post.body != null
        ? Text(post.body, style: _style)
        : Padding(padding: EdgeInsets.all(0));
  }

  Widget _user() {
    return Text(post.postedBy != null ? post.postedBy : "Jane Doe",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.secondary.color()));
  }

  Widget _contactButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FlatButton(
        child: Text(
          LocalizedCommunityStrings.contactToLocalized(),
          style: TextStyle(fontSize: 16),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _originDestination() {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: FieldNameAndValue(
            fieldName: LocalizedCommunityStrings.fromToLocalized(),
            value: post.origin,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: FieldNameAndValue(
            fieldName: LocalizedCommunityStrings.destinationToLocalized(),
            value: post.destination,
          ),
        ),
      ],
    );
  }
}
