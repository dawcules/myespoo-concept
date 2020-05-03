import 'package:cityprog/widgets/database_model/database.dart';
import 'package:cityprog/widgets/database_widgets/stream_builder_voting.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/Backgrounds/background_widget.dart';


class VotingPage extends StatefulWidget {
  @override
  createState() => _VotingState();
}

class _VotingState extends State<VotingPage> {

  void voteFor(index,number){
    Database().voteFor(index,number); 
  }
  void voteAgainst(index,number){
    Database().voteAgainst(index,number);  
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: Colors.white,
      //resizeToAvoidBottomInset: true,
      body: Center(
        child: Container(
          height: 1000,
          width: 750,
        child: Column(
        children: <Widget>[
          Container(
            height: heigth/5,
            child: Stack(
              children: <Widget>[
                kIsWeb ? SizedBox(height: 200, width: 200,) : BackgroundWidget(heigth: heigth/4.5, width: width+30, imageUrl: "assets/images/backgroundtesting.png",),
                kIsWeb ? BackgroundWidget(top: 40, heigth: 100, width: 150, imageUrl: "assets/images/smartespoo.png",) : BackgroundWidget(top:-10,heigth: heigth/5, width: width/2, imageUrl: "assets/images/backgroundmyespoo.png",)
              ],
            ),
          ),
           Expanded(child: StreamBuilderVoting(myQuery: Database().getCollection("voting"), voteFor: voteFor, voteAgainst: voteAgainst)),
          ] 
          ),
          ),   
        ),
     );
  }
}
