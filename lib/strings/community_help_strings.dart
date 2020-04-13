import '../current_language.dart';
import './string_provider.dart' show Language;

class LocalizedCommunityHelpStrings {
  // FIN
  static const String titleFI = 'Smart Espoo   -   Apupalvelut';

  // ENG
  static const String titleEN = 'Smart Espoo   -   Help Services';

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

}