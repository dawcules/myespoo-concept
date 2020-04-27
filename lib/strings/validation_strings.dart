import 'package:cityprog/current_language.dart';
import 'package:cityprog/strings/string_provider.dart' show Language;

class ValidationStrings {
  static String titleErrorTextToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return "Otsikon pituus vähintään 5 kirjainta";
      case Language.EN:
        return "The title must be at least 5 characters long";
      default:
        return "The title must be at least 5 characters long";
    }
  }

  static String descriptionErrorTextToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return "Yksityiskohtien pituus vähintään 10 kirjainta";
      case Language.EN:
        return "The description must be at least 10 characters long";
      default:
        return "The description must be at least 10 characters long";
    }
  }

  static String fillAllFieldsToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return "Täytä kaikki vaaditut kentät";
      case Language.EN:
        return "Fill all required fields";
      default:
        return "Fill all required fields";
    }
  }

  static String chooseDateToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return "Valitse päivämäärä";
      case Language.EN:
        return "Choose date";
      default:
        return "Choose date";
    }
  }

  static String chooseTimeToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return "Valitse aika";
      case Language.EN:
        return "Choose time";
      default:
        return "Choose time";
    }
  }

  static String mandatoryFieldToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return "Pakollinen kenttä";
      case Language.EN:
        return "Mandatory field";
      default:
        return "Mandatory field";
    }
  }
}
