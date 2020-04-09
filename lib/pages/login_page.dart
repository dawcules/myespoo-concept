import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/buttons/login_button.dart';
import 'package:cityprog/widgets/containers/box_container.dart';
import 'package:flutter/material.dart';
import '../animations/FadeAnimation.dart';
import '../widgets/Inputs/boxedinput.dart';
import '../widgets/buttons/login_button.dart';
import '../widgets/Backgrounds/background_widget.dart';
import '../widgets/texts/centered_text.dart';
import '../widgets/texts/header_text.dart';
import '../styles/color_palette.dart';

class LoginPage extends StatefulWidget {
  @override
  createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: heigth/2,
            child: Stack(
              children: <Widget>[
                BackgroundWidget(heigth: heigth/2, width: width+30, imageUrl: "assets/images/backgroundtesting.png",),
                BackgroundWidget(top: 40, heigth: heigth/10, width: width/3, imageUrl: "assets/images/smartespoo.png",)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(1.5,
                HeaderText(text: "Login", fontsize: 30, color:  AppColor.secondary.color())),
                SizedBox(
                  height: 30,
                ),
               FadeAnimation(1.5, ShadowedBoxContainer(children: <Widget>[Boxedinput("Username"),
                      Boxedinput("Password"),],)),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(1.7 , CenteredText(text: "Forgot password?", color: AppColor.primary.color())),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(1.9 ,LoginButton("LOGIN")),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(2, CenteredText(text: "Create Account", color:  AppColor.primary.color())),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
