//import 'package:cityprog/strings/voting_strings.dart';
//import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/strings/voting_strings.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/Backgrounds/background_widget.dart';
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:cityprog/widgets/database_widgets/stream_builder_voting.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class VotingPage extends StatefulWidget {
  @override
  createState() => _VotingState();
}

class _VotingState extends State<VotingPage> {

  void _voteFor(index,number){
    Database().voteFor(index,number); 
    
  }
  void _voteAgainst(index,number){
    Database().voteAgainst(index,number);
    
  }
  bool _hasVoted(index){
     final hasVoted = Database().checkForVoted(index);
     return hasVoted;
  }
  void _update(){
    setState(() {     
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body:CustomScrollView(
        slivers: <Widget>[
        SliverAppBar(
          //pinned: true,
          floating: true,
          expandedHeight: heigth / 4,
          backgroundColor: Colors.white,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(VotingStrings.headerToLocalized(), style: TextStyle(color: AppColor.secondary.color()),),
            background: Stack(children: <Widget>[
                //kIsWeb ? SizedBox(height: 200,width: 200) : BackgroundWidget(heigth: heigth/3, width: width+30, imageUrl: "assets/images/backgroundtesting.png",),
                kIsWeb ? BackgroundWidget(top: 200, heigth: 100, width: 150, imageUrl: "assets/images/smartespoo.png",) : BackgroundWidget(top: 50 , heigth: heigth/7, width: width/2.8, imageUrl: "assets/images/smartespoo.png",)
            ],),
          ),
        ),
        StreamBuilderVoting(myQuery: Database().getCollection("voting"), voteFor: _voteFor, voteAgainst: _voteAgainst, hasVoted: _hasVoted, update: _update),
  ],
    ),
    );
  }
}
