import 'package:cityprog/strings/string_provider.dart';

import '../current_language.dart';

class VotingStrings {

  //FI
  static const String headerFI = "Äänestä";
  static const String forFI = "Puolesta";
  static const String againstFI = "Vastaan";
  static const String alreadyVotedFI = "Olet jo äänestänyt aiheesta";

  //EN
  static const String headerEN = "Vote";
  static const String forEN = "For";
  static const String againstEN = "Against";
  static const String alreadyVotedEN = "You have already voted on this topic";

  //FUNC
  static String headerToLocalized() {  
    switch (CurrentLanguage.value) {
      case Language.FI:
        return headerFI;
        break;
      case Language.EN:
        return headerEN ;
        break;
      default:
        return headerEN ;
        break;
    }
}
 static String forToLocalized() {  
    switch (CurrentLanguage.value) {
      case Language.FI:
        return forFI;
        break;
      case Language.EN:
        return forEN ;
        break;
      default:
        return forEN ;
        break;
    }
}
static String againstToLocalized() {  
    switch (CurrentLanguage.value) {
      case Language.FI:
        return againstFI;
        break;
      case Language.EN:
        return againstEN ;
        break;
      default:
        return againstEN ;
        break;
    }
}
static String alreadyVotedToLocalized() {  
    switch (CurrentLanguage.value) {
      case Language.FI:
        return alreadyVotedFI;
        break;
      case Language.EN:
        return alreadyVotedEN ;
        break;
      default:
        return alreadyVotedEN ;
        break;
    }
}

}