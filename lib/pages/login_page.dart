import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/Inputs/boxed_form_password.dart';
import 'package:cityprog/widgets/buttons/login_button.dart';
import 'package:cityprog/widgets/containers/box_container.dart';
import 'package:flutter/material.dart';
import '../animations/FadeAnimation.dart';
import '../widgets/Inputs/boxed_form_email.dart';
import '../widgets/Backgrounds/background_widget.dart';
import '../widgets/links/centered_text.dart';
import '../widgets/texts/header_text.dart';

class LoginPage extends StatefulWidget {
  @override
  createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {

  final _formKey = new GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  
  void _validateSubmit(){
   if (_formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      print("Doing good!");
    }
  }

  void _toProfile(){
    Navigator.of(context).pushNamed("/profile");
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: 
      SingleChildScrollView(
        child:Form(
        key: _formKey, 
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: heigth/2.2,
            child: Stack(
              children: <Widget>[
                BackgroundWidget(heigth: heigth/2.2, width: width+30, imageUrl: "assets/images/backgroundtesting.png",),
                BackgroundWidget(top: 40, heigth: heigth/10, width: width/3, imageUrl: "assets/images/smartespoo.png",)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FadeAnimation(1.5,
                HeaderText(text: "Login", fontsize: 30, color:  AppColor.secondary.color())),
                SizedBox(height: 20),
                FadeAnimation(1.5, ShadowedBoxContainer(childWidgets: <Widget>[
                BoxedFormEmail(hint: "Email", validationText: "Insert a proper email",),
                BoxedFormPassword(hint: "Password", validationText: "Password cannot be empty", passwordController: _passwordController),
                ],)),
                SizedBox(height: 10),
                FadeAnimation(1.7 , CenteredText(text: "Forgot password?", color: AppColor.primary.color(), navigateToPage: _toProfile)),
                SizedBox(height: 10),
                FadeAnimation(1.9 ,LoginButton(text: "LOGIN", validateSubmit: _validateSubmit)),
                SizedBox(height: 10),
                FadeAnimation(2, CenteredText(text: "Create Account", color:  AppColor.primary.color(), navigateToPage: _toProfile,)),
              ],
            ),
          ),
        ],
      ),
      ),
      ),
    );
  }
}
