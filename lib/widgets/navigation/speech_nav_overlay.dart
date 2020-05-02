import 'package:cityprog/sensor_utils/speech_recognition/speech_recog.dart';
import 'package:flutter/services.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/dialogs/speech_dialog.dart';
import 'package:cityprog/widgets/navigation/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SpeechNavigationOverlay extends StatefulWidget {
  final Widget child;
  const SpeechNavigationOverlay({@required this.child});

  @override
  _SpeechNavigationOverlayState createState() =>
      _SpeechNavigationOverlayState();
}

class _SpeechNavigationOverlayState extends State<SpeechNavigationOverlay> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _speechIsActivated = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColor.secondary.color(),
    ));
    return getWidget();
  }

  Widget getWidget() {
    if (!kIsWeb) {
      bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
      return Container(
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomPadding: true,
          key: _scaffoldKey,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: SpeechNavigationButton(
            onSpeechActivate: () => _onSpeechActivate(),
            onSpeehDeActivate: () => _onSpeechDeActivate(),
          ),
          // bottomNavigationBar: BottomAppBar(
          //   color: AppColor.secondary.color(),
          //   notchMargin: 4,
          //   shape: CircularNotchedRectangle(),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: <Widget>[
          //       IconButton(
          //         icon: Icon(Icons.menu),
          //         color: AppColor.whiteText.color(),
          //         iconSize: 50,
          //         onPressed: () => _openDrawer(context),
          //       )
          //     ],
          //   ),
          // ),
          drawer: NavigationDrawer(),
          body: Scaffold(
            body: Stack(
              children: <Widget>[
                widget.child,
                Align(
                  alignment: Alignment.bottomCenter * 0.9,
                  child: Container(
                    child: kIsWeb
                        ? Material(
                            child: Text(
                                'Asenna sovellus käyttääksesi puhetoimintoja!'))
                        : Padding(
                            padding: EdgeInsets.all(0),
                          ),
                  ),
                ),
                _buildSpeechActivatedDialog(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: keyboardIsOpened
                        ? Padding(
                            padding: EdgeInsets.all(0),
                          )
                        : Material(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(420)),
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.circular(420),
                              ),
                              child: FloatingActionButton(
                                elevation: 0,
                                  backgroundColor: AppColor.secondary.color(),
                                  child: Icon(Icons.menu),
                                  onPressed: () => _openDrawer(context)),
                            ),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Container(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: NavigationDrawer(),
          body: Stack(
            children: <Widget>[
              widget.child,
              Align(
                alignment: Alignment.bottomCenter * 0.9,
                child: Container(
                  decoration: BoxDecoration(color: AppColor.primary.color()),
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    color: AppColor.whiteText.color(),
                    iconSize: 50,
                    onPressed: () => _openDrawer(context),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                    child: Icon(Icons.list),
                    onPressed: () => _openDrawer(context)),
              )
            ],
          ),
        ),
      );
    }
  }

  void _openDrawer(BuildContext context) {
    _scaffoldKey.currentState.openDrawer();
  }

  void _onSpeechActivate() {
    setState(() {
      _speechIsActivated = true;
    });
  }

  void _onSpeechDeActivate() {
    setState(() {
      _speechIsActivated = false;
    });
  }

  Widget _buildSpeechActivatedDialog() {
    return _speechIsActivated
        ? Align(
            alignment: Alignment.center,
            child: SpeechActiveDialog(),
          )
        : Padding(
            padding: EdgeInsets.all(0),
          );
  }
}
