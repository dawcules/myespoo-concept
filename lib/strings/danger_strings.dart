// Strings that open the danger dialog -- no need for localization.

import 'package:cityprog/current_language.dart';
import 'package:cityprog/strings/string_provider.dart' show Language;

class DangerStrings {
  static List<String> all = [
    "hätä",
    "hätätilanne",
    "hätätila",
    "danger",
    "emergency",
    "112",
    "911",
  ];

  static String droneButtonDescriptionLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return "Kutsu drone -nappi aktivoidaan hätäkeskuksesta. Seuraa heidän antamia ohjeita.";
      case Language.EN:
        return "Call drone -button will be activated from the emergency call centre. Follow their instructions.";
      default:
        return "Call drone -button will be activated from the emergency call centre. Follow their instructions.";
    }
  }

  static String callClosetDroneToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return "Kutsu lähin drone";
      case Language.EN:
        return "Call for closest drone";
      default:
        return "Call for closest drone";
    }
  }
}
