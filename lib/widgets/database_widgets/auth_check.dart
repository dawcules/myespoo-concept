import 'package:cityprog/model/profile_create.dart';
import 'package:cityprog/pages/general_feed.dart';
import 'package:cityprog/pages/login_page.dart';
import 'package:cityprog/widgets/navigation/speech_nav_overlay.dart';
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
          final _user = AuthBloc.currentUser(context);
          if(ProfileCreate().isAccountCreating())
          { 
            print("bootstrapper account creation");
            ProfileCreate().creatingAccount();
            ProfileCreate().createProfile(user:_user.uid);
            return SpeechNavigationOverlay(child: GeneralFeed());
          }
          print("Logged in");
          return SpeechNavigationOverlay(child: GeneralFeed());
        }else{
           print("Not logged in");
          return LoginPage();
        }
      },
    );
  }
}