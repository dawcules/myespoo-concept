

import 'package:cityprog/strings/string_provider.dart';

import '../current_language.dart';

class LoginStrings {

  //FIN
  static const String loginFI = "Kirjaudu";
  static const String emailFI = "Sähköposti";
  static const String emailValidationTextFI = "Laittaisitko oikean sähköpostiosoitteen";
  static const String passwordFI = "Salasana";
  static const String passwordValidationTextFI = "Salasanasi pitää olla vähintään 7 merkkiä";
  static const String forgotPwFI = "Unohditko salasanasi?";
  static const String loginBtnFI = "KIRJAUDU";
  static const String createAccFI = "Luo tili";

  // ENG
  static const String loginEN = "Login";
  static const String emailEN = "Email";
  static const String emailValidationTextEN = "Insert a proper email address";
  static const String passwordEN = "Password";
  static const String passwordValidationTextEN = "Password must be at least 7 digits";
  static const String forgotPwEN = "Forget password?";
  static const String loginBtnEN = "LOGIN";
  static const String createAccEN = "Create Account";

   static String loginHeaderToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return loginFI;
        break;
      case Language.EN:
        return loginEN;
        break;
      default:
        return loginEN;
        break;
    }
  }
  static String emailToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return emailFI;
        break;
      case Language.EN:
        return emailEN;
        break;
      default:
        return emailEN;
        break;
    }
  }
  static String emailValidationToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return emailValidationTextFI;
        break;
      case Language.EN:
        return emailValidationTextEN;
        break;
      default:
        return emailValidationTextEN;
        break;
    }
  }
  static String passwordToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return passwordFI;
        break;
      case Language.EN:
        return passwordEN;
        break;
      default:
        return passwordEN;
        break;
    }
  }
  static String passwordValidationToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return passwordValidationTextFI;
        break;
      case Language.EN:
        return passwordValidationTextEN;
        break;
      default:
        return passwordValidationTextEN;
        break;
    }
  }
  static String forgotPwToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return forgotPwFI;
        break;
      case Language.EN:
        return forgotPwEN;
        break;
      default:
        return forgotPwEN;
        break;
    }
  }
  static String loginBtnToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return loginBtnFI;
        break;
      case Language.EN:
        return loginBtnEN;
        break;
      default:
        return loginBtnEN;
        break;
    }
  }
   static String createAccToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return createAccFI;
        break;
      case Language.EN:
        return createAccEN;
        break;
      default:
        return createAccEN;
        break;
    }
  }

}

 