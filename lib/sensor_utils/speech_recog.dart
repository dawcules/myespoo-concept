import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:toast/toast.dart';

class SpeechToRoute extends StatefulWidget {
  @override
  _SpeechToRouteState createState() => _SpeechToRouteState();
}

// iOS:lle dependencyt jossain vaiheessa, kun tulee vastaan!

class _SpeechToRouteState extends State<SpeechToRoute> {
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;
  bool _isEvaluating = false;
  bool _hasPermissions = false;

  final List<String> communityMatchers = const ["community", "commune"];
  final List<String> homeMatchers = const ["home", "ho"];
  final List<String> personalMatchers = const ["personal", "personnel"];
  final List<String> introductionMatchers = const ["introduction", "intro"];

  String resultText = "";

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
      (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
      () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
      (String speech) => setState(() => resultText = speech),
    );

    _speechRecognition.setRecognitionCompleteHandler(
      () => setState(() {
        _isListening = false;
        if (!_isEvaluating) {
          _evaluateSpeech();
        }
      }),
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
        );
  }

  Future<bool> checkPermissionsGrantedAsync() async {
    return await Permission.microphone.isGranted;
  }

  Future<void> requestPermissionsAsync() async {
    print("requesting...");
    PermissionStatus request = await Permission.microphone.request();
    if (request.isGranted) {
      setState(() => _hasPermissions = true);
      _listen();
    }
  }

  void _navigateWithoutData(String route) {
    Navigator.of(context).pushNamed(route);
  }

  void _evaluateSpeech() {
    setState(() {
      _isEvaluating = true;
    });

    print("homeMatchers.contains(home): ${homeMatchers.contains("home")}");

    if (communityMatchers.contains(resultText))
      _navigateWithoutData("/community");
    else if (homeMatchers.contains(resultText))
      Navigator.of(context).pushNamed('/home', arguments: "Poista app bar????");
    else if (personalMatchers.contains(resultText))
      _navigateWithoutData("/personal");
    else if (introductionMatchers.contains(resultText))
      _navigateWithoutData("/introduction");
    else
      print("nope");
    _clearState();
  }

  void _clearState() {
    setState(() {
      resultText = "";
      _isEvaluating = false;
    });
  }

  void _listen() {
    if (_isAvailable && !_isListening) {
      _speechRecognition.listen(locale: "en_US");
    }
  }

  @override
  Widget build(BuildContext context) {
    return speechFabNoText();
  }

  Widget speechFabNoText() {
    return FloatingActionButton(
      child: Icon(Icons.mic),
      onPressed: () {
        if (_hasPermissions) {
          if (_isAvailable && !_isListening) {
            _speechRecognition
                .listen(locale: "en_US")
                .then((result) => print('$result'));
          }
        } else {
          requestPermissionsAsync();
        }
      },
      backgroundColor: Colors.pink,
    );
  }

  Widget speechGDNoText() {
    return GestureDetector(
      child: Icon(Icons.mic),
      onLongPress: () {
        if (_hasPermissions) {
          if (_isAvailable && !_isListening) {
            _speechRecognition.listen(locale: "en_US");
          }
        } else {
          requestPermissionsAsync();
        }
      },
      onLongPressUp: () {
        _speechRecognition.stop();
      },
    );
  }

  Widget speechFabWithText() {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  child: Icon(Icons.mic),
                  onPressed: () {
                    if (_hasPermissions) {
                      _listen();
                    } else {
                      requestPermissionsAsync();
                    }
                  },
                  backgroundColor: Colors.pink,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                resultText,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
