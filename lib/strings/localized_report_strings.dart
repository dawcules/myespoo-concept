import 'package:cityprog/current_language.dart';
import 'package:cityprog/strings/string_provider.dart';

class LocalizedReportStrings {
  // FIN
  static String _reportBrokenFI = "Ilmoita rikkimenneestä";
  static String _showInputFieldsFI = "Näytä syöttökentät";
  static String _hideInputFieldsFI = "Piilota syöttökentät";
  static String _reportFormDescriptionFI =
      "Ota kuva ja valitse osoite. Voit myös halutessasi kertoa tilanteesta lisätiedoissa.";
  static String _sentFI = "Lähetetty";
  static String _sendFI = "Liu'uta oikealle lähettääksesi";
  static String _selectAddressFI = "Valitse osoite";
  static String _additionalInfoFI = "Lisätiedot";

  // ENG
  static String _reportBrokenEN = "Report broken";
  static String _showInputFieldsEN = "Show input fields";
  static String _hideInputFieldsEN = "Hide input fields";
  static String _reportFormDescriptionEN =
      "Take a picture and choose an address. You can give more information about the situation in additional information.";
  static String _sentEN = "Sent";
  static String _sendEN = "Slide right to send";
  static String _selectAddressEN = "Select address";
  static String _additionalInfoEN = "Additional information";

  static String showInputFieldsToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _showInputFieldsFI;
      case Language.EN:
        return _showInputFieldsEN;
      default:
        return _showInputFieldsEN;
    }
  }

  static String hideInputFieldsToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _hideInputFieldsFI;
      case Language.EN:
        return _hideInputFieldsEN;
      default:
        return _hideInputFieldsEN;
    }
  }

  static String reportFormDescriptionToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _reportFormDescriptionFI;
      case Language.EN:
        return _reportFormDescriptionEN;
      default:
        return _reportFormDescriptionEN;
    }
  }

  static String sentToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _sentFI;
      case Language.EN:
        return _sentEN;
      default:
        return _sentEN;
    }
  }

  static String sendToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _sendFI;
      case Language.EN:
        return _sendEN;
      default:
        return _sendEN;
    }
  }

  static String selectAddressToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _selectAddressFI;
      case Language.EN:
        return _selectAddressEN;
      default:
        return _selectAddressEN;
    }
  }

  static String additionalInfoToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _additionalInfoFI;
      case Language.EN:
        return _additionalInfoEN;
      default:
        return _additionalInfoEN;
    }
  }

  static String reportBrokenToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _reportBrokenFI;
      case Language.EN:
        return _reportBrokenEN;
      default:
        return _reportBrokenEN;
    }
  }
}
