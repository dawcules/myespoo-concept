import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/strings/widget_texts.dart';
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../model/carpool.dart';
import '../../posts/carpool_post.dart';
import './lower_section.dart';

class CarpoolLower extends StatefulWidget {
  final Function _moreButtonPressed;
  const CarpoolLower(this._moreButtonPressed);

  @override
  _CarpoolLowerState createState() => _CarpoolLowerState();
}

class _CarpoolLowerState extends State<CarpoolLower> {
  ListView _offeringPosts;
  ListView _askingPosts;
  ListView _allPosts;

  int _dropdownValue; // TODO: Localize IT!
  List<String> dropdownItems = [
    LocalizedWidgetStrings.allCategoriesToLocalized(),
    LocalizedWidgetStrings.askingToLocalized(),
    LocalizedWidgetStrings.offeringToLocalized()
  ];

  bool _fetchedAndBuilt;

  @override
  void initState() {
    super.initState();
    _dropdownValue = 0;
    _fetchedAndBuilt = false;
    _offeringPosts = ListView(children: <Widget>[]);
    _askingPosts = ListView(children: <Widget>[]);
    _allPosts = ListView(children: <Widget>[]);
    _getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _fetchedAndBuilt
          ? Expanded(
              child: SizedBox(
                child: LowerSection(
                  _getCorrectItems(),
                  header: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    child: Align(
                      child: DropdownButtonFormField<int>(
                        hint: Text(dropdownItems[_dropdownValue]),
                        isExpanded: true,
                        onChanged: (value) => setState(
                            () => {_dropdownValue = value, print(value)}),
                        items: <DropdownMenuItem<int>>[
                          DropdownMenuItem(
                            child: Text(dropdownItems[0]),
                            value: 0,
                          ),
                          DropdownMenuItem(
                            child: Text(dropdownItems[1]),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text(dropdownItems[2]),
                            value: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  Widget _getCorrectItems() {
    switch (_dropdownValue) {
      case 0:
        return _allPosts;
      case 1:
        return _askingPosts;
      case 2:
        return _offeringPosts;
      default:
        return Text("_dropDownValue invalid");
    }
  }

  void _getAllPosts() async {
    List<CarpoolPostData> askingPosts = [];
    List<CarpoolPostData> offeringPosts = [];
    QuerySnapshot offering = await _getOfferingPosts();
    QuerySnapshot asking = await _getAskingPosts();
    List<DocumentSnapshot> offeringDocs = offering.documents;
    List<DocumentSnapshot> askingDocs = asking.documents;
    offeringDocs.forEach((document) => {
          offeringPosts.add(CarpoolPostData.fromMap(document.data)),
        });
    askingDocs.forEach((document) => {
          askingPosts.add(CarpoolPostData.fromMap(document.data)),
        });
    List<CarpoolPostData> allPosts = (askingPosts + offeringPosts);
    allPosts.sort();
    setState(() {
      _askingPosts = _buildList(context, askingPosts);
      _offeringPosts = _buildList(context, offeringPosts);
      _allPosts = _buildList(context, allPosts);
      _fetchedAndBuilt = true;
    });
  }

  Future<QuerySnapshot> _getOfferingPosts() {
    //return Database().getMarketplaceSelling();
    return Database().getCommunityPosts(
        document: "Carpool",
        collection: Trading.OFFERING.toDatabaseCollectionId());
  }

  Future<QuerySnapshot> _getAskingPosts() {
    return Database().getCommunityPosts(
        document: "Carpool",
        collection: Trading.ASKING.toDatabaseCollectionId());
  }

  Widget _buildList(BuildContext context, List<CarpoolPostData> posts) {
    return ListView.builder(
      itemCount: posts.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int position) {
        return Padding(
          padding: EdgeInsets.all(8),
          child: _getRow(position, context, posts),
        );
      },
    );
  }

  Widget _getRow(
      int position, BuildContext context, List<CarpoolPostData> posts) {
    return CarpoolPostWidget(
        posts[position], () => widget._moreButtonPressed(posts[position]));
  }
}
