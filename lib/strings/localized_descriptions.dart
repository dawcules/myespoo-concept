// Descriptions of keywords and commands directed to the user.

class LocalizedDescriptions {
  // Finnish
  static Map<String, String> commandsFI = {
    "Komennot": "Avaa tämän näkymän.",
    "Uusi": "Anna \"Uusi\" -komennon jälkeen avainsana minne haluat navigoida." +
            "\nEsimerkki: \"Uusi kimppakyyti\" -> Navigoi kimppakyydit sivulle uuteen ilmoitukseen.",
    "Apua": "Avaa apupalvelut.",
    "Navigoi":
        "Anna \"Navigoi\" -komennon jälkeen avainsana minne haluat navigoida." +
            "\nEsimerkki: \"Navigoi kotiin\" -> navigoi kotisivulle.",
    "Avainsanat": "Avainsanat ovat komennon jälkeen annettavia tarkennuksia." +
        "\nKomennolla avainsanat, saat listan kaikista käytettävistä avainsanoista.",
  };
  static Map<String, String> keywordsFI = {
    "Koti": "Navigoi kotiin",
    "Yhteisö": "Navigoi yhteisöön",
    "Oma": "Navigoi omaan",
    "Tutustu": "Navigoi tutustuminen",
    "Kimppakyydit": "Navigoi kimppakyydit",
    "Kimppakyydit": "Uusi kimppakyyti",
    "Tori": "Navigoi tori",
    "Tori": "Uusi tori",
  };

  // English
  static Map<String, String> commandsEN = {
    "Commands": "Opens this dialog.",
    "Help": "Opens help services",
    "New": "After New, give a keyword to specify where you would like to navigate." +
            "\nExample: \"New carpool\" -> navigates to the carpool page.",
    "Navigate":
        "After Navigate, give a keyword to specify where you would like to navigate." +
            "\nExample: \"Navigate home\" -> navigates to the home page.",
    "Keywords":
        "Keywords are used after commands to specify which action to take." +
            "\nUsing keywords as a command, will open up a dialog of all usable keywords.",
  };
  static Map<String, String> keywordsEN = {
    "Home": "Navigate home",
    "Community": "Navigate community",
    "Personal": "Navigate personal",
    "Introduction": "Navigate introduction",
    "Carpool": "Navigate carpool",
    "Carpool": "New carpool",
    "Marketplace": "Navigate marketplace",
    "Marketplace": "New marketplace",
  };
}
