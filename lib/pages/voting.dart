import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:cityprog/widgets/database_widgets/stream_builder_voting.dart';
import 'package:flutter/material.dart';



class VotingPage extends StatefulWidget {
  @override
  createState() => _VotingState();
}

class _VotingState extends State<VotingPage> {

  bool hasVoted;
  void _voteFor(index,number){
    Database().voteFor(index,number); 
    _hasVoted(index);  
  }
  void _voteAgainst(index,number){
    Database().voteAgainst(index,number);
    _hasVoted(index);  
  }
  void _hasVoted(index){
     hasVoted = Database().checkForVoted(index);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: Colors.blue,
      //resizeToAvoidBottomInset: true,
      body: Center(
        child: Container(
          height: 1000,
          width: 750,
        child: Column(
        children: <Widget>[
           Container(
            height: 100,
            width: width,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text("Public Voting", style: TextStyle(fontFamily: "RadicalLight", fontSize: 30, color: AppColor.whiteText.color()),),),
          Container(
            height: 50,
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: SizedBox()),
            Expanded(child:StreamBuilderVoting(myQuery: Database().getCollection("voting"), voteFor: _voteFor, voteAgainst: _voteAgainst, hasVoted:hasVoted),),
          ], 
          ),
          ),   
        ),
     );
  }
}
