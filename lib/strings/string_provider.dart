import './navigation_strings.dart';
import './localized_descriptions.dart';

// provides localized string bundles

enum Language { FI, EN }

class StringProvider {
  static Map<String, Map<String, dynamic>> localizedStringBundle(
      Language target) {
    return {
      "commands": {
        "navigate": NavigationStrings.localizedNavigateStrings(target),
        "help": NavigationStrings.localizedHelpStrings(target),
        "keywords": keywordsToLocalized(target),
      },
      "keywords": {
        "home": NavigationStrings.localizedHomeStrings(target),
        "introduction": NavigationStrings.localizedIntroductionStrings(target),
        "community": NavigationStrings.localizedCommunityStrings(target),
        "personal": NavigationStrings.localizedPersonalStrings(target),
      },
      "commandDescriptions": localizedCommandDescriptions(target),
      "keywordDescriptions": localizedKeywordDescriptions(target),
      "keywordInitialChars": localizedKeywordInitialChars(target),
      "unknown": {
        "command": unknownCommandToLocalized(target),
        "keyword": unknownKeywordToLocalized(target),
      },
    };
  }

  static Map<String, String> localizedCommandDescriptions(Language target) {
    return target == Language.FI
        ? LocalizedDescriptions.commandsFI
        : LocalizedDescriptions.commandsEN;
  }

  static String unknownKeywordToLocalized(Language target) {
    switch (target) {
      case Language.FI:
        return "Tuntematon avainsana";
        break;
      case Language.EN:
        return "Unknown keyword";
        break;
      default:
        return "Unknown keyword";
        break;
    }
  }

  static String unknownCommandToLocalized(Language target) {
    switch (target) {
      case Language.FI:
        return "Tuntematon komento";
        break;
      case Language.EN:
        return "Unknown command";
        break;
      default:
        return "Unknown command";
        break;
    }
  }

  static List<String> keywordsToLocalized(Language target) {
    switch (target) {
      case Language.FI:
        return [
          "Avainsanat",
          "Avainsana",
          "Avain",
          "avainsanat",
          "avainsana",
          "avain"
        ];
        break;
      case Language.EN:
        return [
          "Keywords",
          "Keyword",
          "Key",
          "keywords",
          "keyword",
          "key",
          "keywords"
        ];
        break;
      default:
        return [
          "Keywords",
          "Keyword",
          "Key",
          "keywords",
          "keyword",
          "key",
          "keywords"
        ];
        break;
    }
  }

  static String continueToLocalized(Language target) {
    switch (target) {
      case Language.FI:
        return "Jatka";
        break;
      case Language.EN:
        return "Continue";
        break;
      default:
        return "Continue";
        break;
    }
  }

  static String holdToSpeakToLocalized(Language target) {
    switch (target) {
      case Language.FI:
        return "Pidä pohjassa ja puhu";
        break;
      case Language.EN:
        return "Hold and speak";
        break;
      default:
        return "Hold and speak";
        break;
    }
  }

  static Map<String, String> localizedKeywordDescriptions(Language target) {
    switch (target) {
      case Language.FI:
        return LocalizedDescriptions.keywordsFI;
        break;
      case Language.EN:
        return LocalizedDescriptions.keywordsEN;
        break;
      default:
        return LocalizedDescriptions.keywordsEN;
        break;
    }
  }

  // Method that return the first character of the first item in keywords.
  // For example, keyword home when the locale is Finnish, returns "k" (from "koti").
  // This is for for performance optimization purposes ---
  // Not having to loop through every irrelevant keyword when evaluating the command.
  static Map<String, String> localizedKeywordInitialChars(Language target) {
    return {
      "home": target == Language.FI
          ? NavigationStrings.homeFI[0][0].toLowerCase()
          : NavigationStrings.homeEN[0][0].toLowerCase(),
      "introduction": target == Language.FI
          ? NavigationStrings.introductionFI[0][0].toLowerCase()
          : NavigationStrings.introductionEN[0][0].toLowerCase(),
      "community": target == Language.FI
          ? NavigationStrings.communityFI[0][0].toLowerCase()
          : NavigationStrings.communityEN[0][0].toLowerCase(),
      "personal": target == Language.FI
          ? NavigationStrings.personalFI[0][0].toLowerCase()
          : NavigationStrings.personalEN[0][0].toLowerCase(),
    };
  }

  static Language localeToLanguage(String localeId) {
    switch (localeId) {
      case "en_GB":
        return Language.EN;
      case "en_US":
        return Language.EN;
      case "fi_FI":
        return Language.FI;
      default:
        return Language.EN;
    }
  }
}
