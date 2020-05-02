import 'package:cityprog/widgets/buttons/universal_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:cityprog/styles/color_palette.dart';

class VotingListTile extends StatelessWidget {

  final dynamic index;
  VotingListTile(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[50],
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
                        UniversalRaisedButton(title: "FOR",),
                        UniversalRaisedButton(title: "AGAINST",),
                        ],),
                ],
              ),         
            //Image.network(index['img'].toString()),     
    );
  }
}