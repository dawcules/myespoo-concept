import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/lists/votingListTile.dart';
import 'package:flutter/material.dart';


// Example. Streambuildattu Listview firestore datalla. päivitetään eventin likeja painamalla.
class StreamBuilderVoting extends StatelessWidget {
  //Tähän siis sisään collection mikä näytetään
  final myQuery;
  final voteFor;
  final voteAgainst;

  StreamBuilderVoting({this.myQuery, this.voteFor, this.voteAgainst});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: myQuery,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading..');
            return VotingListViewBuilder(snapshot.data.documents, voteFor, voteAgainst);
          }),
    );
  }
}

//SWagety. Pistin samaan selkeyden
class VotingListViewBuilder extends StatelessWidget {
  final queryData;
  final Function voteFor;
  final Function voteAgainst;

  VotingListViewBuilder(this.queryData,this.voteFor,this.voteAgainst);

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
                  _buildListItem(context, queryData[index],voteFor,voteAgainst),
                  Divider(),
                ],
              );
            }));
  }

  Widget _buildListItem(BuildContext context, index, voteFor, voteAgainst) {
    return VotingListTile(index: index, voteFor: voteFor, voteAgainst: voteAgainst);
  }
}
