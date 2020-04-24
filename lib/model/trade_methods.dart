import '../strings/community_strings.dart';

enum Trading {
  BUYING,
  SELLING,
  FREE,
  ASKING,
  OFFERING,
}

extension TradeMethodFromString on Trading {
  static Trading fromString(String method) {
    switch (method) {
      case LocalizedCommunityStrings.buyingFI:
        return Trading.BUYING;
        break;
      case LocalizedCommunityStrings.sellingFI:
        return Trading.SELLING;
        break;
      case LocalizedCommunityStrings.freeFI:
        return Trading.FREE;
        break;
      case LocalizedCommunityStrings.askingFI:
        return Trading.ASKING;
        break;
      case LocalizedCommunityStrings.offeringFI:
        return Trading.OFFERING;
      case LocalizedCommunityStrings.buyingEN:
        return Trading.BUYING;
        break;
      case LocalizedCommunityStrings.sellingEN:
        return Trading.SELLING;
        break;
      case LocalizedCommunityStrings.freeEN:
        return Trading.FREE;
        break;
      case LocalizedCommunityStrings.askingEN:
        return Trading.ASKING;
        break;
      case LocalizedCommunityStrings.offeringEN:
        return Trading.OFFERING;
        break;
      default:
        return null;
    }
  }
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
