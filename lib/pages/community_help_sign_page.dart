import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:cityprog/widgets/dialogs/citizenpoint_update.dart';
import 'package:flutter/material.dart';
import 'package:cityprog/strings/community_help_strings.dart';
import 'package:cityprog/widgets/database_model/auth.dart';

class CommunityHelpPage extends StatefulWidget {
  @override
  _CommunityHelpPageState createState() => _CommunityHelpPageState();
}

class _CommunityHelpPageState extends State<CommunityHelpPage> {

  var signed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Container(
            height: 1000,
            width: 750,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 8,
                                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text(
                              LocalizedCommunityHelpStrings.volunteerBtnToLocalized(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 26),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('assets/images/helper.jpg')),
                          ),
                          Padding(padding: EdgeInsets.all(20.0)),
                          Container(
                            margin: EdgeInsets.all(20.0),
                            child: Text(
                                LocalizedCommunityHelpStrings.signDescLocalized(),
                                style: TextStyle(fontSize: 20)),
                          ),
                          if (signed == false)
                          RaisedButton(
                            color: AppColor.button.color(),
                            onPressed: () {
                              setState(() {
                                signed = true;                            
                              });
                              Database().helpSignUp(Auth().getUID());
                              showDialog(context: context, child: CitizenPointUpdateDialog(amount: 200, title: Text("We appreciate what you did."),));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 16,
                              ),
                              child: Text(
                                LocalizedCommunityHelpStrings.signUpToLocalized(),
                                style: TextStyle(
                                  color: AppColor.buttonText.color(),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(10),)
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
