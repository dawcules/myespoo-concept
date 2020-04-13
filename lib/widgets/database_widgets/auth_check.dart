import 'package:cityprog/pages/login_page.dart';
import 'package:cityprog/pages/welcome_page.dart';
import 'package:fb_auth/fb_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is LoggedInState) {
          return WelcomePage();
        }
        return LoginPage();
      },
    );
  }
}