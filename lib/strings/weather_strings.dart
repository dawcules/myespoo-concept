import '../current_language.dart';
import 'package:cityprog/strings/string_provider.dart' show Language;

class LocalizedWeatherStrings {
  // FIN
  static const String weatherTitleFI = 'Sää Espoossa nyt';
  static const String degreesFI = 'astetta';

  // ENG
  static const String weatherTitleEN = 'Current weather in Espoo';
    static const String degreesEN = 'degrees';

      static String degreesToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return  degreesFI;
        break;
      case Language.EN:
        return  degreesEN;
        break;
      default:
        return  degreesEN;
        break;
    }
  }


  static String weatherTitleToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return  weatherTitleFI;
        break;
      case Language.EN:
        return  weatherTitleEN;
        break;
      default:
        return  weatherTitleEN;
        break;
    }
  }

}