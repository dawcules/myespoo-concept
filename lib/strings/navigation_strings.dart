import '../current_language.dart';
import 'package:cityprog/strings/string_provider.dart' show Language;

// Localized strings for speech navigation

class NavigationStrings {
  // Finnish
  static const List<String> navigateFI = const [
    "navigoi",
    "navigaatio",
    "Navigoi",
    "Navigaatio"
  ];
  static const List<String> homeFI = const [
    "koti",
    "kotiin",
    "kotia",
    "Koti",
    "Kotiin",
    "Kotia"
  ];
  static const List<String> introductionFI = const [
    "tutustu",
    "tutustuminen",
    "tutustua",
    "Tutustu",
    "Tutustuminen",
    "Tutustua",
  ];
  static const List<String> communityFI = const [
    "yhteisö",
    "yhteisöön",
    "yhteisöä",
    "Yhteisö",
    "Yhteisöön",
    "Yhteisöä",
  ];
  static const List<String> personalFI = const ["oma", "omaan", "Oma", "Omaan"];
  static const List<String> helpFI = const [
    "apua",
    "apu",
    "apuun",
    "auta",
    "Apua",
    "Apu",
    "Apuun",
    "Auta"
  ];
  static const List<String> carpoolFI = const [
    "kimppakyyti",
    "Kimppakyyti",
    "kyyti",
  ];
  static const List<String> marketFI = const [
    "tori",
    "tori-ilmoitus",
    "tori ilmoitus",
    "Tori",
    "Tori-ilmoitus",
    "Tori ilmoitus",
  ];

  // English
  static const List<String> navigateEN = const [
    "navigate",
    "navigation",
    "Navigate",
    "Navigation"
  ];
  static const List<String> homeEN = const [
    "home",
    "ho",
    "hoe",
    "Home",
    "Ho",
    "Hoe",
  ];
  static const List<String> introductionEN = const [
    "introduction",
    "intro",
    "introduce",
    "Introduction",
    "Intro",
    "Introduce",
  ];
  static const List<String> communityEN = const [
    "community",
    "commune",
    "Community",
    "Commune",
  ];
  static const List<String> personalEN = const [
    "personal",
    "person",
    "Personal",
    "Person",
  ];
  static const List<String> helpEN = const [
    "help",
    "Help",
    "HELP",
  ];
  static const List<String> carpoolEN = const [
    "carpool",
    "carpools",
    "Carpool",
    "car",
    "carpal",
  ];
  static const List<String> marketEN = const [
    "market",
    "markets",
    "marketplace",
    "Market",
    "Marketplace",
  ];

  // Methods that return a localized string
  // appropriate for given Language argument
  static List<String> localizedNavigateStrings() {
    return CurrentLanguage.value == Language.FI ? navigateFI : navigateEN;
  }

  static List<String> localizedHomeStrings() {
    return CurrentLanguage.value == Language.FI ? homeFI : homeEN;
  }

  static List<String> localizedIntroductionStrings() {
    return CurrentLanguage.value == Language.FI
        ? introductionFI
        : introductionEN;
  }

  static List<String> localizedCommunityStrings() {
    return CurrentLanguage.value == Language.FI ? communityFI : communityEN;
  }

  static List<String> localizedPersonalStrings() {
    return CurrentLanguage.value == Language.FI ? personalFI : personalEN;
  }

  static List<String> localizedHelpStrings() {
    return CurrentLanguage.value == Language.FI ? helpFI : helpEN;
  }

  static List<String> localizedCarpoolStrings() {
    return CurrentLanguage.value == Language.FI ? carpoolFI : carpoolEN;
  }

  static List<String> localizedMarketStrings() {
    return CurrentLanguage.value == Language.FI ? marketFI : marketEN;
  }

  static String homeToLocalized() {
    return CurrentLanguage.value == Language.FI ? "Koti" : "Home";
  }

  static String communityToLocalized() {
    return CurrentLanguage.value == Language.FI ? "Yhteisö" : "Community";
  }

  static String helpServicesToLocalized() {
    return CurrentLanguage.value == Language.FI
        ? "Apupalvelut"
        : "Help services";
  }

  static String introductionToLocalized() {
    return CurrentLanguage.value == Language.FI ? "Tutustu" : "Introduction";
  }

  static String personalToLocalized() {
    return CurrentLanguage.value == Language.FI ? "Oma" : "Personal";
  }

  static String speechDialogHelpString() {
    return CurrentLanguage.value == Language.FI
        ? "Puhekomento: \"Komennot\" – avaa näkyviin valikon, joka pitää sisällään kaikki komennot!"
        : "Speech command: \"Commands\" – opens up a dialog, that contains all usable commands!";
  }
}
