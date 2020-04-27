// Google places api seems to not be free, so random data for addresses.

import 'package:cityprog/current_language.dart';
import 'package:cityprog/strings/string_provider.dart' show Language;

class DummyAdress {
  static List<String> all = [
    "Iivisniementie 1, 02260 Espoo",
    "Taavilantie 19, 02180 Espoo",
    "Kulttuuriaukio 2, 02100 Espoo",
    "Kipparinkatu 8, 02320 Espoo",
    "Kamreerintie 3, 02770 Espoo",
    "Kukkaromäki 2, 02770 Espoo",
    "Lanttikatu 7, 02770 Espoo",
    "Kutojantie 2, 02630 Espoo",
    "Knektbron 4, 02630 Esbo",
    "Nihtisillankuja 4, 02631 Espoo",
    "Sinimäentie 6 A, 02630 Espoo",
    "Kutojantie 6-8, 02630 Espoo",
    "Lansantie 23, 08100 Espoo",
    "Aspelinintie 3 D, 02630 Espoo",
    "Nuijalantie 13, 02630 Espoo",
    "Karakaari 7, 02610 Espoo",
    "Karaniityntie 4, 02610 Espoo",
    "Karaniityntie 2, 02610 Espoo",
    "Kilonkartanontie 4, 02610 Espoo",
    "Degerbyntie 16, 02600 Espoo",
    "Jääskentie 22, 02140 Espoo",
  ];

  static String addressRequiredToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return "Pakollinen";
      case Language.EN:
        return "Required";
      default:
        return "Required";
    }
  }
}
