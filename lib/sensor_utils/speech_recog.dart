import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:toast/toast.dart';
import 'dart:async';

import '../router.dart';

class SpeechToRoute extends StatefulWidget {
  @override
  _SpeechToRouteState createState() => _SpeechToRouteState();
}

class _SpeechToRouteState extends State<SpeechToRoute>
    with TickerProviderStateMixin {
  AnimationController _controller;

  //bool _hasSpeech = false;
  bool _hasPermissions = false;

  double level = 0.0;

  String lastWords = "";
  String lastError = "";
  String lastStatus = "";
  String _currentLocaleId = "";

  final SpeechToText speech = SpeechToText();

  final List<String> communityMatchers = const [
    "community",
    "commune",
    "yhteisö"
  ];
  final List<String> homeMatchers = const ["home", "ho", "koti", "kotiin"];
  final List<String> personalMatchers = const [
    "personal",
    "personnel",
    "oma",
    "omaan"
  ];
  final List<String> introductionMatchers = const [
    "introduction",
    "intro",
    "apu",
    "tutustu",
    "apuun"
  ];

  @override
  void initState() {
    super.initState();
    initSpeechState();
    _initAnimationController();
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: (statusListener));
    if (hasSpeech) {
      var systemLocale = await speech.systemLocale();
      _currentLocaleId = systemLocale.localeId;
    }

    if (!mounted) return;

    // setState(() {
    //   _hasSpeech = hasSpeech;
    // });
  }

  Future<bool> checkPermissionsGrantedAsync() async {
    return await Permission.microphone.isGranted;
  }

  Future<void> requestPermissionsAsync() async {
    print("requesting...");
    PermissionStatus request = await Permission.microphone.request();
    if (request.isGranted) {
      setState(() => _hasPermissions = true);
      startListening();
      _controller.forward();
    }
  }

  void _initAnimationController() {
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.25,
      duration: Duration(milliseconds: 200),
    );
  }

  void _navigateWithoutArgs(String route) {
    Navigator.of(context).pushNamed(route);
  }

  void _navigateWithArgs(String route, dynamic args) {
    Navigator.of(context).pushNamed(route, arguments: args);
  }

  void _evaluateSpeech() {
    print(lastWords);
    List<String> wordsToList = lastWords.split(" ");
    if (lastWords.startsWith("navigate") || lastWords.startsWith("navigoi")) {
      for (var word in wordsToList) {
        switch (word[0]) {
          case "y":
          case "c":
            _navigateIfMatch(word, Routes.COMMUNITY);
            break;
          case "k":
          case "h":
            _navigateIfMatch(word, Routes.HOME);
            break;
          case "o":
          case "p":
            _navigateIfMatch(word, Routes.PERSONAL);
            break;
          case "a":
          case "i":
          case "t":
            _navigateIfMatch(word, Routes.INTRO);
            break;
        }
      }
    } else {
      Toast.show("Unknown command: $lastWords", context,
          duration: Toast.LENGTH_LONG);
      // showDialog(
      //     context: context,
      //     child: CommandErrorDialog(
      //       lastWords,
      //     ));
    }
  }

  void _navigateIfMatch(String word, Routes route) {
    switch (route) {
      case Routes.HOME:
        if (homeMatchers.contains(word))
          _navigate(true, route, "Poista appi baaaaaaari?");
        break;
      case Routes.PERSONAL:
        if (personalMatchers.contains(word)) _navigate(false, route, null);
        break;
      case Routes.COMMUNITY:
        if (communityMatchers.contains(word)) _navigate(false, route, null);
        break;
      case Routes.INTRO:
        if (introductionMatchers.contains(word)) _navigate(false, route, null);
        break;
      default:
        print("nope");
    }
  }

  void _navigate(bool withArgs, Routes route, dynamic args) {
    // setState(() {
    //   _matchFound = true;
    // });
    if (withArgs) {
      _navigateWithArgs(route.name, args);
    } else {
      _navigateWithoutArgs(route.name);
    }
  }

  void _clearState() {
    setState(() {
      lastWords = "";
      // _matchFound = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return IconButton(
    //   icon: Icon(Icons.mic),
    //   onPressed: _hasPermissions
    //       ? () => startListening()
    //       : requestPermissionsAsync(),
    // );
    return activateSpeechButtonNoText(200 * _controller.value);
  }

  Widget activateSpeechButtonNoText(double radius) {
    return GestureDetector(
        child: Icon(Icons.mic, size: radius),
        onLongPress: () {
          if (_hasPermissions) {
            setState(() {
              _controller.forward();
            });
            startListening();
          } else {
            requestPermissionsAsync();
          }
        },
        onLongPressUp: () {
          setState(() {
            stopListening();
            _controller.reset();
          });
        },
        onTap: () =>
            Toast.show("Hold and speak", context, duration: Toast.LENGTH_LONG));
  }

  void startListening() {
    lastWords = "";
    lastError = "";
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 10),
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        partialResults: true);
    setState(() {});
  }

  void stopListening() {
    speech.stop();
    setState(() {
      level = 0.0;
    });
    _evaluateSpeech();
  }

  void cancelListening() {
    speech.cancel();
    setState(() {
      level = 0.0;
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords = "${result.recognizedWords}";
    });
  }

  void soundLevelListener(double level) {
    setState(() {
      this.level = level;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    setState(() {
      lastError = "${error.errorMsg}";
      print(lastError);
    });
  }

  void statusListener(String status) {
    print(status);
  }
}
