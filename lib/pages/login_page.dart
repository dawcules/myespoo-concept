import 'package:flutter/material.dart';
import '../animations/LoginFadeAnimation.dart';

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
                /*Positioned(
                  top: -40,
                  height: heigth/2,
                  width: width + 20,
                  child: LoginFadeAnimation(1, Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/background-3.png'),
                      fit: BoxFit.fill,
                    )),
                  ),),
                ),*/
                Positioned(
                  height: heigth/2,
                  width: width + 30,
                  child: LoginFadeAnimation(1.3,Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/backgroundtesting.png'),
                      fit: BoxFit.fill,     
                    )),
                  ),),
                ),
                Positioned(
                  top:40,
                  height: heigth/10,
                  width: width/3,
                  child: LoginFadeAnimation(1.3,Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/smartespoo.png'),
                      fit: BoxFit.fill,     
                    )),
                  ),),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                LoginFadeAnimation(1.5, Text(
                  'Login',
                  style: TextStyle(
                      color: Color.fromRGBO(21, 22, 255, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),),
                SizedBox(
                  height: 30,
                ),
               LoginFadeAnimation(1.5, Container(
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
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: Colors.grey[300],
                        ))),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Username",
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: Colors.grey[200],
                        ))),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                    ],
                  ),
                )),
                SizedBox(
                  height: 20,
                ),
                LoginFadeAnimation(1.7 ,Center(
                  child: Text("Forgot password?",
                      style:
                          TextStyle(color: Color.fromRGBO(14, 80, 186, 1))),
                )),
                SizedBox(
                  height: 20,
                ),
                LoginFadeAnimation(1.9 ,Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(14, 80, 186, 1),
                  ),
                  child: Center(
                    child: Text("Login", style: TextStyle(color: Colors.white),)
                  ),
                )),
                SizedBox(
                  height: 20,
                ),
                LoginFadeAnimation(2,Center(
                  child: Text("Create Account",
                      style:
                          TextStyle(color: Color.fromRGBO(14, 80, 186, 1))),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
