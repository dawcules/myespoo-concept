import '../current_language.dart';
import 'package:cityprog/strings/string_provider.dart' show Language;

class LocalizedCommunityHelpStrings {
  // FIN
  static const String titleFI = 'Smart Espoo   -   Apupalvelut';
  static const String mainTitleFI = 'Apupalvelut';
  static const String descFI =
      'Pyydä apua kanssakaupunkilaisilta tai ilmoittaudu avuntarjoajaksi muille';
  static const List<String> listFI = [
    'Valitse kategoria',
    'Kauppa-asiointi',
    'Huonekalut',
    'Pihatyöt',
    'Muu tarve'
  ];
  static const String volunteerBtnFI = 'Ilmoittaudu avuntarjoajaksi';
  static const String catBtnFI = 'Aloita';
  static const String snackFI = 'Valitse jokin kategoria';
  static const String signUpFI = 'Ilmoittaudu';
  static const String signDescFI =
      'Ilmoittautumalla avuntarjoajaksi autat muita selviämään arjen askareissa ja edistät yleistä hyvinvointia';
  static const String askHelpBtnFI = 'Luo uusi pyyntö';
  static const String postedFI = 'Ilmoitus jätetty';
  static const String submitTitleFI = 'Jätä avunpyyntö';
  static const String requestDescFI =
      'Anna avunpyynnöllesi otsikko ja kirjoita lyhyt kuvaus tarpeestasi, jotta avunantaja saa selkeän käsityksen mistä on kyse';
        static const String sendFI = 'Lähetä';


  // ENG
  static const String titleEN = 'Smart Espoo   -   Help Services';
  static const String mainTitleEN = 'Help Services';
  static const String descEN = 'Ask citizens for help or volunteer yourself';
  static const List<String> listEN = [
    'Choose a category',
    'Store visits',
    'Furniture',
    'Yardwork',
    'Other'
  ];
  static const String volunteerBtnEN = 'Sign up as a helper';
  static const String catBtnEN = 'Start';
  static const String snackEN = 'Pick a category';
  static const String signUpEN = 'Sign up';
  static const String signDescEN =
      'Sign up as a helper to help others manage their everyday lives better and to uphold general wellbeing';
  static const String askHelpBtnEN = "Create a new request";
  static const String postedEN = 'Ad posted on';
  static const String submitTitleEN = 'Leave a help request';
  static const String requestDescEN =
      'Give your help request a title and write a short description of your need, so the helper can get a clear idea of what the request is about';
        static const String sendEN = 'Send';

      static String sendToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return sendFI;
        break;
      case Language.EN:
        return sendEN;
        break;
      default:
        return sendEN;
        break;
    }
  }

  static String requestDescToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return requestDescFI;
        break;
      case Language.EN:
        return requestDescEN;
        break;
      default:
        return requestDescEN;
        break;
    }
  }

  static String submitTitleToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return submitTitleFI;
        break;
      case Language.EN:
        return submitTitleEN;
        break;
      default:
        return submitTitleEN;
        break;
    }
  }

  static String postedToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return postedFI;
        break;
      case Language.EN:
        return postedEN;
        break;
      default:
        return postedEN;
        break;
    }
  }

  static String askHelpToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return askHelpBtnFI;
        break;
      case Language.EN:
        return askHelpBtnEN;
        break;
      default:
        return askHelpBtnEN;
        break;
    }
  }

  static String signDescLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return signDescFI;
        break;
      case Language.EN:
        return signDescEN;
        break;
      default:
        return signDescEN;
        break;
    }
  }

  static String signUpToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return signUpFI;
        break;
      case Language.EN:
        return signUpEN;
        break;
      default:
        return signUpEN;
        break;
    }
  }

  static String snackToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return snackFI;
        break;
      case Language.EN:
        return snackEN;
        break;
      default:
        return snackEN;
        break;
    }
  }

  static String catBtnToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return catBtnFI;
        break;
      case Language.EN:
        return catBtnEN;
        break;
      default:
        return catBtnEN;
        break;
    }
  }

  static String volunteerBtnToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return volunteerBtnFI;
        break;
      case Language.EN:
        return volunteerBtnEN;
        break;
      default:
        return volunteerBtnEN;
        break;
    }
  }

  static List<String> listToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return listFI;
        break;
      case Language.EN:
        return listEN;
        break;
      default:
        return listEN;
        break;
    }
  }

  static String descToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return descFI;
        break;
      case Language.EN:
        return descEN;
        break;
      default:
        return descEN;
        break;
    }
  }

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

  static String mainTitleToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return mainTitleFI;
        break;
      case Language.EN:
        return mainTitleEN;
        break;
      default:
        return mainTitleEN;
        break;
    }
  }

  static String weAppreciateToLocalized(int value) {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return 'Arvostamme mukaanlähtemistäsi.\n\nTässä kiitoksena 🏆$value Kansalaispistettä!';
        break;
      case Language.EN:
        return 'We appreciate your contribution.\n\nAs a reward, we have given you 🏆$value Citizen Points!';
        break;
      default:
        return 'We appreciate your contribution.\n\nAs a reward, we have given you 🏆$value Citizen Points!';
        break;
    }
  }
}
