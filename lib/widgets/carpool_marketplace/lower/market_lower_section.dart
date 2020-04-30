import 'package:cityprog/model/market.dart';
import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/strings/widget_texts.dart';
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:cityprog/widgets/posts/market_post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import './lower_section.dart';

class MarketLower extends StatefulWidget {
  final Function _moreButtonPressed;
  const MarketLower(this._moreButtonPressed);

  @override
  _MarketLowerState createState() => _MarketLowerState();
}

class _MarketLowerState extends State<MarketLower> {
  ListView _sellingPosts;
  ListView _buyingPosts;
  ListView _freePosts;
  ListView _allPosts;

  int _dropdownValue; // TODO: Localize IT!
  List<String> dropdownItems = [
    LocalizedWidgetStrings.allCategoriesToLocalized(),
    LocalizedWidgetStrings.sellingToLocalized(),
    LocalizedWidgetStrings.buyingToLocalized(),
    LocalizedWidgetStrings.freeToLocalized(),
  ];

  bool _fetchedAndBuilt;

  @override
  void initState() {
    super.initState();
    _dropdownValue = 0;
    _fetchedAndBuilt = false;
    _sellingPosts = ListView(children: <Widget>[]);
    _buyingPosts = ListView(children: <Widget>[]);
    _freePosts = ListView(children: <Widget>[]);
    _allPosts = ListView(children: <Widget>[]);
    _getAllPosts(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _fetchedAndBuilt
          ? Expanded(
              child: LowerSection(
                _getCorrectItems(),
                header: Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Align(
                    child: DropdownButtonFormField<int>(
                      hint: Text(dropdownItems[_dropdownValue]),
                      isExpanded: true,
                      onChanged: (value) =>
                          setState(() => {_dropdownValue = value}),
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
                        DropdownMenuItem(
                          child: Text(dropdownItems[3]),
                          value: 3,
                        ),
                      ],
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
        return _sellingPosts;
      case 2:
        return _buyingPosts;
      case 3:
        return _freePosts;
      default:
        return Text("_dropDownValue invalid");
    }
  }

  ListView _buildList(BuildContext context, List<MarketPostData> posts) {
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
      int position, BuildContext context, List<MarketPostData> posts) {
    return MarketPostWidget(
        posts[position], () => widget._moreButtonPressed(posts[position]));
  }

  void _getAllPosts(BuildContext context) async {
    List<MarketPostData> sellingPosts = [];
    List<MarketPostData> buyingPosts = [];
    List<MarketPostData> freePosts = [];
    QuerySnapshot selling = await _getSellingPosts();
    QuerySnapshot buying = await _getBuyingPosts();
    QuerySnapshot free = await _getFreePosts();
    List<DocumentSnapshot> sellingDocs = selling.documents;
    List<DocumentSnapshot> buyingDocs = buying.documents;
    List<DocumentSnapshot> freeDocs = free.documents;
    sellingDocs.forEach((document) => {
          sellingPosts.add(MarketPostData.fromMap(document.data)),
        });
    buyingDocs.forEach((document) => {
          buyingPosts.add(MarketPostData.fromMap(document.data)),
        });
    freeDocs.forEach((document) => {
          freePosts.add(MarketPostData.fromMap(document.data)),
        });
    List<MarketPostData> allPosts = (sellingPosts + buyingPosts + freePosts);
    allPosts.sort();
    if (mounted) {
      setState(() {
        _sellingPosts = _buildList(context, sellingPosts);
        _buyingPosts = _buildList(context, buyingPosts);
        _freePosts = _buildList(context, freePosts);
        _allPosts = _buildList(context, allPosts);
        _fetchedAndBuilt = true;
      });
    }
  }

  Future<QuerySnapshot> _getBuyingPosts() {
    return Database().getCommunityPosts(
        document: "Marketplace",
        collection: Trading.BUYING.toDatabaseCollectionId());
  }

  Future<QuerySnapshot> _getSellingPosts() {
    return Database().getCommunityPosts(
        document: "Marketplace",
        collection: Trading.SELLING.toDatabaseCollectionId());
  }

  Future<QuerySnapshot> _getFreePosts() {
    return Database().getCommunityPosts(
        document: "Marketplace",
        collection: Trading.FREE.toDatabaseCollectionId());
  }
}
