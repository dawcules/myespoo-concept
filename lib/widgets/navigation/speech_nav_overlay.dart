import 'package:cityprog/sensor_utils/speech_recognition/speech_recog.dart';
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
    return getWidget();
  }

  Widget getWidget() {
    if (!kIsWeb) {
      return Container(
        child: Scaffold(
          key: _scaffoldKey,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: SpeechNavigationButton(
            onSpeechActivate: () => _onSpeechActivate(),
            onSpeehDeActivate: () => _onSpeechDeActivate(),
          ),
          bottomNavigationBar: BottomAppBar(
            color: AppColor.secondary.color(),
            notchMargin: 4,
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  color: AppColor.whiteText.color(),
                  iconSize: 50,
                  onPressed: () => _openDrawer(context),
                )
              ],
            ),
          ),
          drawer: NavigationDrawer(),
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
            ],
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
        ? Center(
            child: SpeechActiveDialog(),
          )
        : Padding(
            padding: EdgeInsets.all(0),
          );
  }
}
