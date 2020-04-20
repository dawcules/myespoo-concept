import 'package:cityprog/strings/string_provider.dart';
import 'package:cityprog/widgets/dialogs/commands_dialog.dart';
import 'package:cityprog/widgets/dialogs/keywords_dialog.dart';
import 'package:cityprog/widgets/posts/report_form.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../../router.dart';

// Speech to route module

class SpeechToRoute {
  List<String> _keywordsCommands;
  List<String> _navigateCommands;
  List<String> _helpCommands;
  List<String> _newCommands;
  List<String> _commandsCommands;
  List<String> _reportStrings;

  String _homeInitialChar;
  String _communityInitialChar;
  String _communitySecondChar;
  String _introductionInitialChar;
  String _personalInitialChar;
  String _carpoolInitialsChar;
  String _carpoolSecondChar;
  String _marketInitialsChar;
  String _reportInitialsChar;

  Map<String, Map<String, dynamic>> _navStringBundleLocalized;

  BuildContext _context;
  Language _language;

  void init(BuildContext context, Language language) {
    _context = context;
    _language = language;
    _initLocalizedStringsBundle();
  }

  void _initLocalizedStringsBundle() {
    print(_language);
    _navStringBundleLocalized = StringProvider.localizedStringBundle(_language);
    _initBundleReferences();
  }

  void _initBundleReferences() {
    _reportStrings = _navStringBundleLocalized["keywords"]["report"];
    _keywordsCommands = _navStringBundleLocalized["commands"]["keywords"];
    _navigateCommands = _navStringBundleLocalized["commands"]["navigate"];
    _helpCommands = _navStringBundleLocalized["commands"]["help"];
    _commandsCommands = _navStringBundleLocalized["commands"]["commands"];
    _newCommands = _navStringBundleLocalized["commands"]["new"];
    _homeInitialChar = _navStringBundleLocalized["keywordInitialChars"]["home"];
    _communityInitialChar =
        _navStringBundleLocalized["keywordInitialChars"]["community"];
    _introductionInitialChar =
        _navStringBundleLocalized["keywordInitialChars"]["introduction"];
    _personalInitialChar =
        _navStringBundleLocalized["keywordInitialChars"]["personal"];
    _carpoolInitialsChar =
        _navStringBundleLocalized["keywordInitialChars"]["carpool"];
    _marketInitialsChar =
        _navStringBundleLocalized["keywordInitialChars"]["market"];
    _reportInitialsChar =
        _navStringBundleLocalized["keywordInitialChars"]["report"];
    _communitySecondChar =
        _navStringBundleLocalized["keywordInitialChars"]["community_second"];
    _carpoolSecondChar =
        _navStringBundleLocalized["keywordInitialChars"]["carpool_second"];
  }

  void evaluateSpeech(String transcription) {
    // Recognized words from user speech input into a list
    List<String> transcriptionToList = transcription.split(" ");
    // The first word in user speech input is assumed to be a command
    String userCommand = transcriptionToList[0];

    if (_navigateCommands.contains(userCommand)) {
      // The command was "navigate" -> check if route is valid
      for (var word in transcriptionToList) {
        String firstChar = word[0].toLowerCase();
        String secondChar = word[1].toLowerCase();
        if (firstChar == _homeInitialChar)
          _navigateIfMatch(word, Routes.HOME);
        else if (firstChar == _communityInitialChar &&
            secondChar == _communitySecondChar)
          _navigateIfMatch(word, Routes.COMMUNITY);
        else if (firstChar == _introductionInitialChar)
          _navigateIfMatch(word, Routes.INTRODUCTION);
        else if (firstChar == _personalInitialChar)
          _navigateIfMatch(word, Routes.PERSONAL);
        else if (firstChar == _carpoolInitialsChar &&
            secondChar == _carpoolSecondChar)
          _navigateIfMatch(word, Routes.CARPOOL);
        else if (firstChar == _marketInitialsChar) {
          _navigateIfMatch(word, Routes.MARKETPLACE);
        }
      }
    } else if (_helpCommands.contains(userCommand)) {
      // The command was "help" -> open a help dialog with all commands
      _navigateWithoutArgs(Routes.COMMUNITYHELP.name);
    } else if (_commandsCommands.contains(userCommand)) {
      // The command was "commands" -> open a commands dialog with all commands
      showDialog(
          context: _context,
          child:
              CommandsDialog(_navStringBundleLocalized["commandDescriptions"]));
    } else if (_keywordsCommands.contains(userCommand)) {
      // The command was "keywords" -> open a dialog with all the keywords
      showDialog(
        context: _context,
        child: KeywordsDialog(_navStringBundleLocalized["keywordDescriptions"]),
      );
    } else if (_newCommands.contains(userCommand)) {
      // THe command was "new" -> attempt to navigate to an appropriate route
      for (var word in transcriptionToList) {
        String firstChar = word[0].toLowerCase();
        if (firstChar == _carpoolInitialsChar)
          _navigateIfMatch(word, Routes.CARPOOL_NEW);
        else if (firstChar == _marketInitialsChar) {
          _navigateIfMatch(word, Routes.MARKET_NEW);
        } else if (firstChar == _reportInitialsChar) {
          if (_reportStrings.contains(word)) {
            showDialog(context: _context, child: ReportForm());
          }
        }
      }
    } else {
      // The command was unknown
      Toast.show(
        "${_navStringBundleLocalized["unknown"]["command"]}: $transcription",
        _context,
        duration: Toast.LENGTH_LONG,
        gravity: 2,
      );
    }
  }

  void _navigateIfMatch(String keyword, Routes route) {
    print("attempting to navigate with $keyword to route: ${route.name}");
    switch (route) {
      case Routes.HOME:
        if (_checkIfContains(
            _navStringBundleLocalized["keywords"]["home"], keyword))
          _navigate(true, route, "Poista appi baaaaaaari?");
        break;
      case Routes.PERSONAL:
        if (_checkIfContains(
            _navStringBundleLocalized["keywords"]["personal"], keyword))
          _navigate(false, route, null);
        break;
      case Routes.COMMUNITY:
        if (_checkIfContains(
            _navStringBundleLocalized["keywords"]["community"], keyword))
          _navigate(false, route, null);
        break;
      case Routes.INTRODUCTION:
        if (_checkIfContains(
            _navStringBundleLocalized["keywords"]["introduction"], keyword))
          _navigate(false, route, null);
        break;
      case Routes.CARPOOL:
        if (_checkIfContains(
            _navStringBundleLocalized["keywords"]["carpool"], keyword))
          _navigate(false, route, null);
        break;
      case Routes.MARKETPLACE:
        if (_checkIfContains(
            _navStringBundleLocalized["keywords"]["market"], keyword))
          _navigate(false, route, null);
        break;
      case Routes.MARKET_NEW:
        if (_checkIfContains(
            _navStringBundleLocalized["keywords"]["market"], keyword))
          _navigate(false, route, null);
        break;
      case Routes.CARPOOL_NEW:
        if (_checkIfContains(
            _navStringBundleLocalized["keywords"]["carpool"], keyword))
          _navigate(false, route, null);
        break;
      default:
        break;
    }
  }

  bool _checkIfContains(List<String> keywords, String word) {
    if (keywords.contains(word.toLowerCase())) {
      return true;
    } else {
      Toast.show("${_navStringBundleLocalized["unknown"]["keyword"]}: $word",
          _context);
      return false;
    }
  }

  void _navigate(bool withArgs, Routes route, dynamic args) {
    if (withArgs) {
      _navigateWithArgs(route.name, args);
    } else {
      _navigateWithoutArgs(route.name);
    }
  }

  void _navigateWithoutArgs(String route) {
    Navigator.of(_context).pushNamed(route);
  }

  void _navigateWithArgs(String route, dynamic args) {
    Navigator.of(_context).pushNamed(route, arguments: args);
  }
}
