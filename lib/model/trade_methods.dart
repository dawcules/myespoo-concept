import '../strings/community_strings.dart';

enum Trading {
  BUYING,
  SELLING,
  FREE,
  ASKING,
  OFFERING,
}

extension TrademethodToString on Trading {
  String toLocalizedString() {
    switch (this) {
      case Trading.BUYING:
        return LocalizedCommunityStrings.buyingToLocalized();
        break;
      case Trading.SELLING:
        return LocalizedCommunityStrings.sellingToLocalized();
        break;
      case Trading.FREE:
        return LocalizedCommunityStrings.freeToLocalized();
        break;
      case Trading.ASKING:
        return LocalizedCommunityStrings.askingToLocalized();
        break;
      case Trading.OFFERING:
        return LocalizedCommunityStrings.offeringToLocalized();
        break;
      default:
        return null;
    }
  }
}
