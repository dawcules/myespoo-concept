import 'package:cityprog/widgets/buttons/login_button.dart';
import 'package:flutter/material.dart';
import '../animations/FadeAnimation.dart';
import '../widgets/Inputs/boxedinput.dart';
import '../widgets/buttons/login_button.dart';
import '../widgets/Backgrounds/background_widget.dart';
import '../widgets/texts/centered_text.dart';
import '../widgets/texts/header_text.dart';

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
                BackgroundWidget(top: -40, heigth: heigth/2, width: width+20, imageUrl: "assets/images/background-3.png",),
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
                HeaderText(text: "Login", fontsize: 30, color: Color.fromRGBO(21, 22, 255, 1))),
                SizedBox(
                  height: 30,
                ),
               FadeAnimation(1.5, Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(21, 22, 255, .3),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Boxedinput("Username"),
                      Boxedinput("Password"),
                    ],
                  ),
                )),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(1.7 , CenteredText(text: "Forgot password?", color: Color.fromRGBO(14, 80, 186, 1))),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(1.9 ,LoginButton("LOGIN")),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(2, CenteredText(text: "Create Account", color: Color.fromRGBO(14, 80, 186, 1)),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
