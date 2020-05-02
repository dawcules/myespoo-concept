import '../current_language.dart';
import 'package:cityprog/strings/string_provider.dart' show Language;




class LocalizedPremisesStrings {
  // FIN
  static const String infoFI = "Näpäytä saadaksesi lisätietoja";
  static const String titleFI = "Tilat ja laitteet varattavaksi";


  // ENG
  static const String infoEN = "Tap to get more information";
  static const String titleEN = "Premises and equipment available for booking";

    static String titleToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return titleFI;
        break;
      case Language.EN:
        return titleEN;
        break;
      default:
        return titleEN;
        break;
    }
  }

  static String infoToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return infoFI;
        break;
      case Language.EN:
        return infoEN;
        break;
      default:
        return infoEN;
        break;
    }
  }

}