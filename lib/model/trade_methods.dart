import '../strings/community_strings.dart';
import '../strings/string_provider.dart' show Language;

enum Trading {
  BUYING,
  SELLING,
  FREE,
  ASKING,
  OFFERING,
}

extension TrademethodToString on Trading {
  String toLocalizedString(Language language) {
    switch (this) {
      case Trading.BUYING:
        return LocalizedCommunityStrings.buyingToLocalized(language);
        break;
      case Trading.SELLING:
        return LocalizedCommunityStrings.sellingToLocalized(language);
        break;
      case Trading.FREE:
        return LocalizedCommunityStrings.freeToLocalized(language);
        break;
      case Trading.ASKING:
        return LocalizedCommunityStrings.askingToLocalized(language);
        break;
      case Trading.OFFERING:
        return LocalizedCommunityStrings.offeringToLocalized(language);
        break;
      default:
        return "unknown trading meth.. wtf";
    }
  }
}
