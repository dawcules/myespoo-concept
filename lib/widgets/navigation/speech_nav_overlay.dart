import 'package:cityprog/sensor_utils/speech_recognition/speech_recog.dart';
import 'package:cityprog/widgets/dialogs/speech_dialog.dart';
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
  bool _speechIsActivated = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.child,
        Align(
          alignment: Alignment.bottomCenter * 0.9,
          child: Container(
            child: kIsWeb
                ? Material(
                    child: Text('Asenna sovellus käyttääksesi puhetoimintoja!'))
                : SpeechNavigationButton(
                    onSpeechActivate: () => _onSpeechActivate(),
                    onSpeehDeActivate: () => _onSpeechDeActivate(),
                  ),
          ),
        ),
        _buildSpeechActivatedDialog(),
      ],
    );
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
