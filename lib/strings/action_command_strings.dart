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
}
