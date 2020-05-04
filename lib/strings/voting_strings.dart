import 'package:cityprog/strings/string_provider.dart';

import '../current_language.dart';

class ProfileStrings {

  //FI
   static const String pagenameFI = "Äänestä";

  //EN
   static const String pagenameEN = "Vote";

  //FUNC
  static String pagenameToLocalized() {  
    switch (CurrentLanguage.value) {
      case Language.FI:
        return pagenameFI;
        break;
      case Language.EN:
        return pagenameEN ;
        break;
      default:
        return pagenameEN ;
        break;
    }
}

}