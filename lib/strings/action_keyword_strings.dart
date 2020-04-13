import 'package:cityprog/strings/string_provider.dart' show Language;

import '../current_language.dart';

class ActionKeywords {
  static List<String> actionKeywordsToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return [
          "uusi",
          "kuusi",
          "uus",
          "Uusi",
          "Kuusi",
          "Uus",
        ];
        break;
      case Language.EN:
        return [
          "new",
          "mew",
          "New",
          "Mew",
        ];
        break;
      default:
        return [
          "new",
          "mew",
          "New",
          "Mew",
        ];
        break;
    }
  }
}
