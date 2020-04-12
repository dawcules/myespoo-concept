import 'package:cityprog/strings/string_provider.dart';

class CurrentLanguage {
  static Language _value = Language.EN;

  static get value {
    return _value;
  }

  // Sets a new language if the string is valid, and that language is supported.
  // -> defaults to English if not.
  static setNewFromString(String localeId) {
    print("Attempting to set new language with a locale id of: $localeId");
    _value = StringProvider.localeToLanguage(localeId);
  }
}
