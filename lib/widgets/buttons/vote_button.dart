import 'package:cityprog/styles/color_palette.dart';
import 'package:fb_auth/fb_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VoteButton extends StatelessWidget {

  final String text;
  final index;
  final Function onPress;
  final Icon icon;

  VoteButton({this.text, this.onPress, this.index, this.icon});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) =>  FlatButton(
                      onPressed: () => onPress(index,1),//.documentID
                      child: Row(children: [
                        icon != null ? icon : SizedBox(),
                        Text(text, style: TextStyle(fontFamily: "RadikalLight", fontSize: 20 ,color: AppColor.darkText.color()),),
                        ],)
                    ,)
                  
                
    );
  }
}