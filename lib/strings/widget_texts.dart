import 'package:cityprog/current_language.dart';
import 'package:cityprog/strings/string_provider.dart' show Language;

class LocalizedWidgetStrings {
  // Marketplace FIN
  static String _priceFI = "Hinta";
  static String _freeFI = "Ilmainen";

  // Marketplace ENG
  static String _priceEN = "Price";
  static String _freeEN = "Free";

  static String priceToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _priceFI;
      case Language.EN:
        return _priceEN;
      default:
        return _priceEN;
    }
  }

  static String freeToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _freeFI;
      case Language.EN:
        return _freeEN;
      default:
        return _freeEN;
    }
  }
}
