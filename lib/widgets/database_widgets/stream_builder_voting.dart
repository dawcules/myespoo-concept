import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/lists/votingListTile.dart';
import 'package:flutter/material.dart';


// Example. Streambuildattu Listview firestore datalla. päivitetään eventin likeja painamalla.
class StreamBuilderVoting extends StatelessWidget {
  //Tähän siis sisään collection mikä näytetään
  final myQuery;
  final voteFor;
  final voteAgainst;
  final hasVoted;

  StreamBuilderVoting({this.myQuery, this.voteFor, this.voteAgainst,this.hasVoted});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: myQuery,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading..');
            return VotingListViewBuilder(snapshot.data.documents, voteFor, voteAgainst, hasVoted);
          }),
    );
  }
}

//SWagety. Pistin samaan selkeyden
class VotingListViewBuilder extends StatelessWidget {
  final queryData;
  final Function voteFor;
  final Function voteAgainst;
  final bool hasVoted;

  VotingListViewBuilder(this.queryData,this.voteFor,this.voteAgainst, this.hasVoted);

  @override
  Widget build(BuildContext context) {
    return Ink(
        color: AppColor.background.color(),
        child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: queryData.length,
            itemBuilder: (BuildContext _context, index) {
              return Column(
                children: <Widget>[
                  _buildListItem(context, queryData[index],voteFor,voteAgainst,hasVoted),
                  Divider(),
                ],
              );
            }));
  }

  Widget _buildListItem(BuildContext context, index, voteFor, voteAgainst,hasVoted) {
    return VotingListTile(index: index, voteFor: voteFor, voteAgainst: voteAgainst,hasAlreadyVoted: hasVoted,);
  }
}
