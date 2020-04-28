import 'package:cityprog/model/initialize_profile.dart';
import 'package:cityprog/model/profile_create.dart';
import 'package:cityprog/pages/login_page.dart';
import 'package:cityprog/widgets/database_model/auth.dart';
import 'package:fb_auth/fb_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//This class acts as a "bootstrapper" for authing. 
class AuthCheck extends StatelessWidget {
  const AuthCheck({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Building the authbloc and getting context and state from super
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        //checking if user is logged in
        if (state is LoggedInState) {
         
          //getting the current user from the bloc.. aand sending it back to the singleton. reasons...
          final _user = AuthBloc.currentUser(context);
          Auth().setUser(user: _user);
          //Checking if user is in middle of creating a profile
          if(ProfileCreate().isAccountCreating())
          { 
            //Creating the data profile
            print("bootstrapper account creation");
            ProfileCreate().creatingAccount();
            ProfileCreate().createProfile(user:_user.uid);
            final initializer = InitializeProfile();
            initializer.getUserData();
            //return SpeechNavigationOverlay(child: GeneralFeed());
            return Padding(padding: EdgeInsets.all(0),);
          }
          //Not creating so we go here.
          print("Logged in");
          final initializer = InitializeProfile();
          initializer.getUserData();
          //return SpeechNavigationOverlay(child: GeneralFeed());
          return Padding(padding: EdgeInsets.all(0),);
        }else{
          //Not logged in so we go to login
           print("Not logged in");
          return LoginPage();
        }
      },
    );
  }
}