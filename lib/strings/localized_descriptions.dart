// Descriptions of keywords and commands directed to the user.

class LocalizedDescriptions {
  // Finnish
  static Map<String, String> commandsFI = {
    "Apua": "Avaa tämän näkymän.",
    "Navigoi":
        "Anna \"Navigoi\" -komennon jälkeen avainsana minne haluat navigoida." +
            "\nEsimerkki: \"Navigoi kotiin\" -> navigoi kotisivulle.",
    "Avainsanat": "Avainsanat ovat komennon jälkeen annettavia tarkennuksia." +
        "\nKomennolla avainsanat, saat listan kaikista käytettävistä avainsanoista."
  };
  static Map<String, String> keywordsFI = {
    "Koti": "Navigoi kotiin",
    "Yhteisö": "Navigoi yhteisöön",
    "Oma": "Navigoi omaan",
    "Tutustu": "Navigoi tutustuminen",
  };

  // English
  static Map<String, String> commandsEN = {
    "Help": "Opens this dialog.",
    "Navigate":
        "After Navigate, give a keyword to where you would like to navigate." +
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
  };
}
