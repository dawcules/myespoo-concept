import '../current_language.dart';
import './navigation_strings.dart';
import './localized_descriptions.dart';
import 'action_command_strings.dart';

// Provides a string bundle that contains all the commands,
// keywords, descriptions and localized general words used in widgets.

enum Language { FI, EN }

class StringProvider {
  static Map<String, Map<String, dynamic>> localizedStringBundle(
      Language target) {
    return {
      "commands": {
        "navigate": NavigationStrings.localizedNavigateStrings(),
        "help": NavigationStrings.localizedHelpStrings(),
        "keywords": keywordsToLocalized(),
        "new": ActionCommands.newCommandToLocalized(),
        "commands": ActionCommands.commandsStringsToLocalized(),
      },
      "keywords": {
        "home": NavigationStrings.localizedHomeStrings(),
        "introduction": NavigationStrings.localizedIntroductionStrings(),
        "community": NavigationStrings.localizedCommunityStrings(),
        "personal": NavigationStrings.localizedPersonalStrings(),
        "carpool": NavigationStrings.localizedCarpoolStrings(),
        "market": NavigationStrings.localizedMarketStrings(),
        "report": ActionCommands.reportCommandsToLocalized(),
      },
      "commandDescriptions": localizedCommandDescriptions(),
      "keywordDescriptions": localizedKeywordDescriptions(),
      "keywordInitialChars": localizedKeywordInitialChars(),
      "unknown": {
        "command": unknownCommandToLocalized(),
        "keyword": unknownKeywordToLocalized(),
      },
    };
  }

  static Map<String, String> localizedCommandDescriptions() {
    return CurrentLanguage.value == Language.FI
        ? LocalizedDescriptions.commandsFI
        : LocalizedDescriptions.commandsEN;
  }

  static String unknownKeywordToLocalized() {
    switch (CurrentLanguage.value) {
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

  static String unknownCommandToLocalized() {
    switch (CurrentLanguage.value) {
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

  static List<String> keywordsToLocalized() {
    switch (CurrentLanguage.value) {
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

  static String continueToLocalized() {
    switch (CurrentLanguage.value) {
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

  static String holdToSpeakToLocalized() {
    switch (CurrentLanguage.value) {
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

  static Map<String, String> localizedKeywordDescriptions() {
    switch (CurrentLanguage.value) {
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
  static Map<String, String> localizedKeywordInitialChars() {
    return {
      "home": CurrentLanguage.value == Language.FI
          ? NavigationStrings.homeFI[0][0].toLowerCase()
          : NavigationStrings.homeEN[0][0].toLowerCase(),
      "introduction": CurrentLanguage.value == Language.FI
          ? NavigationStrings.introductionFI[0][0].toLowerCase()
          : NavigationStrings.introductionEN[0][0].toLowerCase(),
      "community": CurrentLanguage.value == Language.FI
          ? NavigationStrings.communityFI[0][0].toLowerCase()
          : NavigationStrings.communityEN[0][0].toLowerCase(),
      "personal": CurrentLanguage.value == Language.FI
          ? NavigationStrings.personalFI[0][0].toLowerCase()
          : NavigationStrings.personalEN[0][0].toLowerCase(),
      "carpool": CurrentLanguage.value == Language.FI
          ? NavigationStrings.carpoolFI[0][0].toLowerCase()
          : NavigationStrings.carpoolEN[0][0].toLowerCase(),
      "market": CurrentLanguage.value == Language.FI
          ? NavigationStrings.marketFI[0][0].toLowerCase()
          : NavigationStrings.marketEN[0][0].toLowerCase(),
      "carpool_second": CurrentLanguage.value == Language.FI
          ? NavigationStrings.carpoolFI[0][1].toLowerCase()
          : NavigationStrings.carpoolEN[0][1].toLowerCase(),
      "community_second": CurrentLanguage.value == Language.FI
          ? NavigationStrings.communityFI[0][1].toLowerCase()
          : NavigationStrings.communityEN[0][1].toLowerCase(),
      "report": ActionCommands.reportCommandsToLocalized()[0][0],
    };
  }

  static Language localeToLanguage(String localeId) {
    switch (localeId) {
      case "en_GB":
        return Language.EN;
      case "en-GB":
        return Language.EN;
      case "en_US":
        return Language.EN;
      case "en-US":
        return Language.EN;
      case "EN":
        return Language.EN;
      case "fi_FI":
        return Language.FI;
      case "fi-FI":
        return Language.FI;
      case "FI":
        return Language.FI;
      default:
        return Language.EN;
    }
  }
}
