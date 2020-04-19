import 'package:cityprog/sensor_utils/speech_recognition/speech_to_route.dart';
import 'package:cityprog/strings/string_provider.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:async';

/*
 * Returns a microphone Widget with a scaling animation,
 * that upon long press (scale up animation) -- listens to user speech, and 
 * after button release (scale down animation) -- evaluteates the speech.
 * If a valid route / action is recognized -- navigates to that route / action.
 * 
 * The speech is evaluated by the system locale language, and
 * the two currently supported languages are Finnish and English.
 */

class SpeechNavigationButton extends StatefulWidget {
  final Function onSpeechActivate;
  final Function onSpeehDeActivate;

  const SpeechNavigationButton({
    @required this.onSpeechActivate,
    @required this.onSpeehDeActivate,
  });

  @override
  _SpeechNavigationButtonState createState() => _SpeechNavigationButtonState();
}

class _SpeechNavigationButtonState extends State<SpeechNavigationButton>
    with TickerProviderStateMixin {
  bool _hasPermissions = false;

  double level = 0.0;

  String _transcription = "";
  String lastError = "";
  String lastStatus = "";
  String _currentLocaleId = "";

  final SpeechToText speech = SpeechToText();
  final SpeechToRoute routeModule = SpeechToRoute();

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    initSpeechState();
    _initAnimationController();
    _initModules();
  }

  void _initSpeechToRoute(Language language) {
    routeModule.init(context, language);
  }

  void _initModules() {
    Language language = StringProvider.localeToLanguage(_currentLocaleId);
    _initSpeechToRoute(language);
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: (statusListener));
    if (hasSpeech) {
      var systemLocale = await speech.systemLocale();
      _currentLocaleId = systemLocale.localeId;
    }

    if (!mounted) return;
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
      _animationController.forward();
      widget.onSpeechActivate();
    }
  }

  void _initAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0.4,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return activateSpeechButtonNoText(175 * _animationController.value);
  }

  Widget activateSpeechButtonNoText(double radius) {
    return GestureDetector(
        child: Container(
          // decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     border: Border.all(color: Colors.black),
          //   ),
          child: Icon(
            Icons.mic,
            size: radius,
            color: Colors.black87,
          ),
        ),
        onTapDown: (details) {
          if (_hasPermissions) {
            setState(() {
              startListening();
            });
          } else {
            requestPermissionsAsync();
          }
        },
        onTapCancel: () => stopListening(),
        onTapUp: (_) => {
              setState(() {
                stopListening();
              }),
            });
  }

  void startListening() {
    _animationController.forward();
    widget.onSpeechActivate();
    _transcription = "";
    lastError = "";
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 10),
        localeId: _currentLocaleId, // fi-FI <--- lokalisaatio demo
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        partialResults: true);
    setState(() {});
  }

  void stopListening() {
    widget.onSpeehDeActivate();
    _animationController.reset();
    speech.stop();
    setState(() {
      level = 0.0;
    });
    Future.delayed(
        const Duration(milliseconds: 500),
        () => {
              print(_transcription),
              if (_hasPermissions) routeModule.evaluateSpeech(_transcription),
            });
  }

  void cancelListening() {
    speech.cancel();
    setState(() {
      level = 0.0;
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      String resultToLower = result.recognizedWords.toLowerCase();
      if (resultToLower == "newmarket") resultToLower = "new market";
      _transcription = "$resultToLower";
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
