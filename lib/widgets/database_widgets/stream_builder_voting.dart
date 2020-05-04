//import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/lists/votingListTile.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


// Example. Streambuildattu Listview firestore datalla. päivitetään eventin likeja painamalla.
class StreamBuilderVoting extends StatelessWidget {
  //Tähän siis sisään collection mikä näytetään
  final myQuery;
  final Function voteFor;
  final Function voteAgainst;
  final Function hasVoted;
  final Function update;

  StreamBuilderVoting({this.myQuery, this.voteFor, this.voteAgainst,this.hasVoted, this.update});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
          stream: myQuery,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return SliverToBoxAdapter(child: Text('Loading..'),);
            return VotingSliverListViewBuilder(snapshot.data.documents, voteFor, voteAgainst, hasVoted, update);
          });
  }
}

//SWagety. Pistin samaan selkeyden
class VotingSliverListViewBuilder extends StatelessWidget {
  final queryData;
  final Function voteFor;
  final Function voteAgainst;
  final Function hasVoted;
  final Function update;

  VotingSliverListViewBuilder(this.queryData,this.voteFor,this.voteAgainst, this.hasVoted, this.update);

  @override
  Widget build(BuildContext context) {
    return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child:Column(
                  children: <Widget>[
                   _buildListItem(context, queryData[index],voteFor,voteAgainst,hasVoted, update),
                  Divider(),
                  ],),);
                  },
                  childCount: queryData.length,
                  ),
              );
  }

  Widget _buildListItem(BuildContext context, index, voteFor, voteAgainst,hasVoted, update) {
    return VotingListTile(index: index, voteFor: voteFor, voteAgainst: voteAgainst,hasAlreadyVoted: hasVoted, update: update);
  }
}
