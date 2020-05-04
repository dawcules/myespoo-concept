import 'package:cityprog/strings/widget_texts.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/buttons/universal_raised_button.dart';
import 'package:cityprog/widgets/posts/report_form.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key key}) : super(key: key);

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
            children: [
              Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _communityNavigationButton(
                            LocalizedWidgetStrings.carpoolToLocalized(),
                            "/carpool",
                            context),
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      _communityNavigationButton(
                            LocalizedWidgetStrings.marketplaceToLocalized(),
                            "/market",
                            context),
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      _communityNavigationButton(
                            LocalizedWidgetStrings.helpServicesToLocalized(),
                            "/communityHelp",
                            context),
                      Padding(padding: EdgeInsets.all(8)),
                      _communityNavigationButton(
                            LocalizedWidgetStrings.premisesToLocalized(),
                            "/premises",
                            context),
                      Padding(padding: EdgeInsets.all(8)),
                      _communityNavigationButton(
                            LocalizedWidgetStrings.voteToLocalized(), "/voting", context),
                      Padding(padding: EdgeInsets.all(8)),
                      Container(
                        width: 260,
                        height: 60,
                        child: UniversalRaisedButton(
                            title: LocalizedWidgetStrings.fixReportToLocalized(),
                            fontSize: 24,
                            padding: 8,
                            onPressed: () =>
                                showDialog(context: context, child: ReportForm()),
                        ),
                      ),
                    ],
                  ),
                ),
                          ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget _communityNavigationButton(
      String title, String route, BuildContext context) {
    return ButtonTheme(
      minWidth: 260,
      height: 60,
      child: RaisedButton(
        color: AppColor.button.color(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              color: AppColor.buttonText.color(),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        onPressed: () => {Navigator.of(context).pushNamed(route)},
      ),
    );
  }
}
