
import 'package:cityprog/strings/voting_strings.dart';
import 'package:cityprog/widgets/buttons/vote_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class VotingListTile extends StatelessWidget {
  final Function hasAlreadyVoted; // Database().checkForVoted(index)
  final dynamic index;
  final Function voteFor;
  final Function voteAgainst;
  final Function update;
  VotingListTile({this.index, this.voteFor, this.voteAgainst, this.hasAlreadyVoted, this.update});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 750,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 8.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                     /*Align(
                      alignment: FractionalOffset.topLeft,
                       child:Container(
                                height: 25,
                                width: 100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.brown),
                                child: Text("Äänestys", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,),
                              ),), */
                    Text(
                      index['title'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                   Text(index['description'].toString(),
                            style: TextStyle(fontSize: 18))                
                  ],
                ),
              ),
            ),
            Column(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  'assets/images/park.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.fitHeight,
                )),
               ],)
               
          ],
        ),
        !hasAlreadyVoted(index) ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ 
                        VoteButton(text: VotingStrings.forToLocalized(), onPress: voteFor,index: index, icon: Icon(FontAwesome.thumbs_up, color: Colors.greenAccent,)),
                        VoteButton(text: VotingStrings.againstToLocalized(), onPress: voteAgainst, index: index, icon:  Icon(FontAwesome.thumbs_down, color: Colors.redAccent,),),
                        ],) : Text(VotingStrings.alreadyVotedToLocalized(), style: TextStyle(fontSize: 20, fontFamily: "RadicalLight",),),
        ]
        ),      
    ),
    );
  }
}



/*
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    index['title'].toString(),
                    style: TextStyle(color: AppColor.secondary.color(), fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(index['description'].toString(), style: TextStyle(fontSize: 16)),
                  //Text( "Hi" +': ' index['date'].toDate().toString().split(' ')[0]),
                  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        VoteButton(text: "FOR", onPress: voteFor,index: index),
                        VoteButton(text: "AGAINST", onPress: voteAgainst, index: index,),
                        ],),
                ],
              ),         
            //Image.network(index['img'].toString()),     
    );
  }
}*/