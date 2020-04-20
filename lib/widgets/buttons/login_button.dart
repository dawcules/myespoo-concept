import 'package:fb_auth/fb_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {

  final String text;
  final Function validateSubmit;

  LoginButton({this.text, this.validateSubmit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(14, 80, 186, 1),
                  ),
                  child: Center(
                    child: FlatButton(
                      onPressed: () => validateSubmit(context: context, state: state),
                      child: Text(text, style: TextStyle(color: Colors.white),)
                    ,)
                  ),
                ),
    );
  }
}