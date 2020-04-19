import 'package:cityprog/current_language.dart';
import 'package:cityprog/strings/string_provider.dart';

class LocalizedReportStrings {
  static String _showInputFieldsFI = "Näytä syöttökentät";
  static String _hideInputFieldsFI = "Piilota syöttökentät";
  static String _reportFormDescriptionFI =
      "Anna otsikko ja kerro tilanteesta — tai ota kuva.";
  static String _sentFI = "Lähetetty";
  static String _sendFI = "Liu'uta oikealle lähettääksesi";

  static String _showInputFieldsEN = "Show input fields";
  static String _hideInputFieldsEN = "Hide input fields";
  static String _reportFormDescriptionEN =
      "Give a title and description of the situation — or take a picture.";
  static String _sentEN = "Sent";
  static String _sendEN = "Slide right to send";

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
}
