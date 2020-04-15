import 'package:cityprog/strings/string_provider.dart' show Language;

import '../current_language.dart';

class ActionCommands {
  static List<String> newCommandToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return [
          "uusi",
          "kuusi",
        ];
        break;
      case Language.EN:
        return [
          "new",
          "mew",
        ];
        break;
      default:
        return [
          "new",
          "mew",
        ];
        break;
    }
  }

  static List<String> reportCommandsToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return [
          "ilmoita",
          "Ilmoita",
          "ilmoitus",
          "Ilmoitus",
        ];
        break;
      case Language.EN:
        return [
          "report",
          "raport",
          "Report",
          "Raport",
        ];
        break;
      default:
        return [
          "report",
          "raport",
          "Report",
          "Raport",
        ];
        break;
    }
  }

  static List<String> commandsStringsToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return [
          "komennot",
          "Komennot",
          "komento"
          "Komento"
        ];
        break;
      case Language.EN:
        return [
          "commands",
          "command",
          "Commands",
          "Command",
        ];
        break;
      default:
        return [
          "commands",
          "command",
          "Commands",
          "Command",
        ];
        break;
    }
  }
}
