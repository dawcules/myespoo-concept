import 'package:cityprog/widgets/dialogs/keywords_dialog.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:toast/toast.dart';
import 'dart:async';

import '../../widgets/dialogs/commands_dialog.dart';
import '../../router.dart';
import '../../strings/string_provider.dart';

/*
 * Returns a microphone Widget with a scaling animation,
 * that upon long press (scale up animation) -- listens to user speech, and 
 * after button release (scale down animation) -- evaluteates the speech.
 * If a valid route / action is recognized -- navigates to that route / action.
 * 
 * The speech is evaluated by the system locale language, and
 * the two currently supported languages are Finnish and English.
 */

class SpeechToAction extends StatefulWidget {
  @override
  _SpeechToActionState createState() => _SpeechToActionState();
}

class _SpeechToActionState extends State<SpeechToAction>
    with TickerProviderStateMixin {
  bool _hasPermissions = false;

  double level = 0.0;

  String _transcription = "";
  String lastError = "";
  String lastStatus = "";
  String _currentLocaleId = "";

  final SpeechToText speech = SpeechToText();

  Map<String, Map<String, dynamic>> _navStringBundleLocalized;
  Language _language;

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    initSpeechState();
    _initAnimationController();
  }

  void _initLocalizedStringsBundle(Language language) {
    print(language);
    _navStringBundleLocalized = StringProvider.localizedStringBundle(language);
    _language = language;
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: (statusListener));
    if (hasSpeech) {
      var systemLocale = await speech.systemLocale();
      _currentLocaleId = systemLocale.localeId;
      Language language = StringProvider.localeToLanguage(_currentLocaleId);
      _initLocalizedStringsBundle(language);
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
    }
  }

  void _initAnimationController() {
    _animationController = AnimationController(
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
    // Pick up the pieces to compare to from the localized string bundle
    List<String> keywordsCommands =
        _navStringBundleLocalized["commands"]["keywords"];
    List<String> navigateCommands =
        _navStringBundleLocalized["commands"]["navigate"];
    List<String> helpCommands = _navStringBundleLocalized["commands"]["help"];
    String homeInitialChar =
        _navStringBundleLocalized["keywordInitialChars"]["home"];
    String communityInitialChar =
        _navStringBundleLocalized["keywordInitialChars"]["community"];
    String introductionInitialChar =
        _navStringBundleLocalized["keywordInitialChars"]["introduction"];
    String personalInitialChar =
        _navStringBundleLocalized["keywordInitialChars"]["personal"];
    List<String> transcriptionToList = _transcription.split(" ");

    // Compare them to user speech
    if (navigateCommands.contains(transcriptionToList[0])) {
      for (var word in transcriptionToList) {
        String firstChar = word[0].toLowerCase();
        if (firstChar == homeInitialChar)
          _navigateIfMatch(word, Routes.HOME);
        else if (firstChar == communityInitialChar)
          _navigateIfMatch(word, Routes.COMMUNITY);
        else if (firstChar == introductionInitialChar)
          _navigateIfMatch(word, Routes.INTRODUCTION);
        else if (firstChar == personalInitialChar)
          _navigateIfMatch(word, Routes.PERSONAL);
      }
    } else if (helpCommands.contains(transcriptionToList[0])) {
      showDialog(
          context: context,
          child: CommandsDialog(
              _navStringBundleLocalized["commandDescriptions"], _language));
    } else if (keywordsCommands.contains(transcriptionToList[0])) {
      showDialog(
        context: context,
        child: KeywordsDialog(
            _navStringBundleLocalized["keywordDescriptions"], _language),
      );
    } else {
      Toast.show(
          "${_navStringBundleLocalized["unknown"]["command"]}: $_transcription",
          context,
          duration: Toast.LENGTH_LONG);
    }
  }

  void _navigateIfMatch(String word, Routes route) {
    switch (route) {
      case Routes.HOME:
        if (_navStringBundleLocalized["keywords"]["home"].contains(word))
          _navigate(true, route, "Poista appi baaaaaaari?");
        break;
      case Routes.PERSONAL:
        if (_navStringBundleLocalized["keywords"]["personal"].contains(word))
          _navigate(false, route, null);
        break;
      case Routes.COMMUNITY:
        if (_navStringBundleLocalized["keywords"]["community"].contains(word))
          _navigate(false, route, null);
        break;
      case Routes.INTRODUCTION:
        if (_navStringBundleLocalized["keywords"]["introduction"]
            .contains(word)) _navigate(false, route, null);
        break;
      default:
        Toast.show("", context);
        print("nope");
    }
  }

  void _navigate(bool withArgs, Routes route, dynamic args) {
    if (withArgs) {
      _navigateWithArgs(route.name, args);
    } else {
      _navigateWithoutArgs(route.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return activateSpeechButtonNoText(200 * _animationController.value);
  }

  Widget activateSpeechButtonNoText(double radius) {
    return GestureDetector(
        child: Icon(Icons.mic, size: radius),
        onLongPress: () {
          if (_hasPermissions) {
            setState(() {
              _animationController.forward();
            });
            startListening();
          } else {
            requestPermissionsAsync();
          }
        },
        onLongPressUp: () {
          setState(() {
            stopListening();
            _animationController.reset();
          });
        },
        onTapCancel: () => {setState(() => _animationController.reset())},
        onTap: () => Toast.show(
            StringProvider.holdToSpeakToLocalized(
                StringProvider.localeToLanguage(_currentLocaleId)),
            context,
            duration: Toast.LENGTH_LONG));
  }

  void startListening() {
    _transcription = "";
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
    Future.delayed(
        const Duration(milliseconds: 500),
        () => {
              print(_transcription),
              _evaluateSpeech(),
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
      _transcription = "${result.recognizedWords}";
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
