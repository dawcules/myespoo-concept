import 'package:cityprog/widgets/columns/user_info_column.dart';
import 'package:cityprog/widgets/database_model/auth.dart';
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:fb_auth/data/classes/auth_user.dart';
import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  final AuthUser _user = Auth().getUser();
  int _citizenPoints;

  void _getUserPosts() {
    
  }

  @override
  void initState() {
    super.initState();
    _getPoints();
  }

  void _getPoints() {
    Database().getUserCitizenpoints(user: _user.uid).then((value) =>
        {setState(() => _citizenPoints = value.data["citizenpoints"])});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: 1000,
            width: 750,
            child: ListView(padding: EdgeInsets.only(bottom: 60), children: [
              Padding(padding: EdgeInsets.all(8)),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: UserInfoColumn(
                      name: _user.displayName,
                      citizenPoints: _citizenPoints,
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(20)),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Your activity",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
