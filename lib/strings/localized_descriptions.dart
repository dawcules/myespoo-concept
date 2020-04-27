// Descriptions of keywords and commands directed to the user.

import 'package:cityprog/current_language.dart';
import 'package:cityprog/strings/string_provider.dart' show Language;

class LocalizedDescriptions {
  // Finnish
  static Map<String, String> commandsFI = {
    "Uusi": "Anna \"Uusi\" -komennon jälkeen avainsana minne haluat navigoida." +
        "\nEsimerkki: \"Uusi kimppakyyti\" -> Navigoi kimppakyydit sivulle uuteen ilmoitukseen.",
    "Apu": "Avaa apupalvelut.",
    "Hätä, Hätätila, 112, 911": "Avaa hätäpalvelun.",
    "Navigoi":
        "Anna \"Navigoi\" -komennon jälkeen avainsana minne haluat navigoida." +
            "\nEsimerkki: \"Navigoi kotiin\" -> navigoi kotisivulle.",
    "Avainsanat": "Avainsanat ovat komennon jälkeen annettavia tarkennuksia." +
        "\nKomennolla avainsanat, saat listan kaikista käytettävistä avainsanoista.",
    "Komennot": "Avaa tämän näkymän.",
  };
  static Map<String, String> keywordsFI = {
    "Koti": "Navigoi kotiin",
    "Yhteisö": "Navigoi yhteisöön",
    "Oma": "Navigoi omaan",
    "Tutustu": "Navigoi tutustuminen",
    "Kimppakyydit": "Navigoi kimppakyydit",
    "Kimppakyydit (uusi ilmoitus)": "Uusi kimppakyyti",
    "Tori": "Navigoi tori",
    "Tori (uusi ilmoitus)": "Uusi tori",
    "Ilmoitus (korjaus)": "Uusi ilmoitus",
  };

  // English
  static Map<String, String> commandsEN = {
    "Help": "Opens help services",
    "Danger, emergency, 112, 911": "Opens emergency services.",
    "New":
        "After New, give a keyword to specify where you would like to navigate." +
            "\nExample: \"New carpool\" -> navigates to the carpool page.",
    "Navigate":
        "After Navigate, give a keyword to specify where you would like to navigate." +
            "\nExample: \"Navigate home\" -> navigates to the home page.",
    "Keywords":
        "Keywords are used after commands to specify which action to take." +
            "\nUsing keywords as a command, will open up a dialog of all usable keywords.",
    "Commands": "Opens this dialog.",
  };
  static Map<String, String> keywordsEN = {
    "Home": "Navigate home",
    "Community": "Navigate community",
    "Personal": "Navigate personal",
    "Introduction": "Navigate introduction",
    "Carpool": "Navigate carpool",
    "Carpool (new post)": "New carpool",
    "Marketplace": "Navigate marketplace",
    "Marketplace (new post)": "New marketplace",
    "Report (fix broken)": "New report",
  };

  static String routeToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return "Reitti";
      case Language.EN:
        return "Route";
      default:
        return "Route";
    }
  }

  static String exampleToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return "Esimerkki";
      case Language.EN:
        return "Example";
      default:
        return "Example";
    }
  }
}
