import 'package:cityprog/current_language.dart';
import 'package:cityprog/strings/string_provider.dart' show Language;

class LocalizedWidgetStrings {
  // Marketplace FIN
  static String _priceFI = "Hinta";
  static String _freeFI = "Ilmainen";
  static String _sellingFI = "Myydään";
  static String _buyingFI = "Ostetaan";
  static String _marketplaceFI = "Tori";

  // Carpool FIN
  static String _offeringFI = "Tarjotaan";
  static String _askingFI = "Pyydetään";
  static String _carpoolFI = "Kimppakyydit";

  //VOTE FI
  static const String voteFI = "Äänestä";

  // Random FIN
  static String _noTitleFi = "Ei otsikkoa";
  static String _allCategoriesFI = "Kaikki kategoriat";
  static String _helpServicesFI = "Apupalvelut";
  static String _postedByFI = "Ilmoituksen tekijä";
  static String _citizenPointsFI = "Kansalaispisteet";
  static String _citizenPointsAwardedFI = "Kansalaispistettä myönnetty";
  static String _niceFI = "Hienoa";
  static String _yourActivityFI = "Sinun toiminta";
  static String _closeFI = "Sulje";
  static String _premisesFI = "Toimitilat";
  static String _mandatoryFI = "Pakolliset";
  static String _additionalFI = "Lisää";
  static String _emergencyFI = "Hätäilmoitus";
  static String _fixReportFI = "Korjausilmoitus";

  // Random ENG
  static String _noTitleEN = "No title";
  static String _allCategoriesEN = "All categories";
  static String _helpServicesEN = "Help services";
  static String _postedByEN = "Posted by";
  static String _citizenPointsEN = "Citizen points";
  static String _citizenPointsAwardedEN = "Citizen Points awarded";
  static String _niceEN = "Nice";
  static String _yourActivityEN = "Your activity";
  static String _closeEN = "Close";
  static String _premisesEN = "Premises";
  static String _mandatoryEN = "Mandatory";
  static String _additionalEN = "Additional";
  static String _emergencyEN = "Emergency";
  static String _fixReportEN = "Report broken";

  // Marketplace ENG
  static String _priceEN = "Price";
  static String _freeEN = "Free";
  static String _sellingEN = "Selling";
  static String _buyingEN = "Buying";
  static String _marketplaceEN = "Marketplace";

  // Carpool ENG
  static String _offeringEN = "Offering";
  static String _askingEN = "Asking";
  static String _carpoolEN = "Carpool";

  //Vote EN
  static const String voteEN = "Vote";

  static String premisesToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _premisesFI;
      case Language.EN:
        return _premisesEN;
      default:
        return _premisesEN;
    }
  }

  static String priceToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _priceFI;
      case Language.EN:
        return _priceEN;
      default:
        return _priceEN;
    }
  }

  static String freeToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _freeFI;
      case Language.EN:
        return _freeEN;
      default:
        return _freeEN;
    }
  }

  static String noTitleToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _noTitleFi;
      case Language.EN:
        return _noTitleEN;
      default:
        return _noTitleEN;
    }
  }

  static String buyingToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _buyingFI;
      case Language.EN:
        return _buyingEN;
      default:
        return _buyingEN;
    }
  }

  static String askingToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _askingFI;
      case Language.EN:
        return _askingEN;
      default:
        return _askingEN;
    }
  }

  static String offeringToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _offeringFI;
      case Language.EN:
        return _offeringEN;
      default:
        return _offeringEN;
    }
  }

  static String sellingToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _sellingFI;
      case Language.EN:
        return _sellingEN;
      default:
        return _sellingEN;
    }
  }

  static String allCategoriesToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _allCategoriesFI;
      case Language.EN:
        return _allCategoriesEN;
      default:
        return _allCategoriesEN;
    }
  }

  static String marketplaceToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _marketplaceFI;
      case Language.EN:
        return _marketplaceEN;
      default:
        return _marketplaceEN;
    }
  }

  static String helpServicesToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _helpServicesFI;
      case Language.EN:
        return _helpServicesEN;
      default:
        return _helpServicesEN;
    }
  }

  static String carpoolToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _carpoolFI;
      case Language.EN:
        return _carpoolEN;
      default:
        return _carpoolEN;
    }
  }

  static String postedByToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _postedByFI;
      case Language.EN:
        return _postedByEN;
      default:
        return _postedByEN;
    }
  }

  static String citizenPointsToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _citizenPointsFI;
      case Language.EN:
        return _citizenPointsEN;
      default:
        return _citizenPointsEN;
    }
  }

  static String niceToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _niceFI;
      case Language.EN:
        return _niceEN;
      default:
        return _niceEN;
    }
  }

  static String citizenPointsAwardedToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _citizenPointsAwardedFI;
      case Language.EN:
        return _citizenPointsAwardedEN;
      default:
        return _citizenPointsAwardedEN;
    }
  }

  static String yourActivityToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _yourActivityFI;
      case Language.EN:
        return _yourActivityEN;
      default:
        return _yourActivityEN;
    }
  }

  static String closeToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _closeFI;
      case Language.EN:
        return _closeEN;
      default:
        return _closeEN;
    }
  }

  static String mandatoryToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _mandatoryFI;
      case Language.EN:
        return _mandatoryEN;
      default:
        return _mandatoryEN;
    }
  }

  static String additionalToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _additionalFI;
      case Language.EN:
        return _additionalEN;
      default:
        return _additionalEN;
    }
  }

  static String fixReportToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _fixReportFI;
      case Language.EN:
        return _fixReportEN;
      default:
        return _fixReportEN;
    }
  }

  static String emergencyToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _emergencyFI;
      case Language.EN:
        return _emergencyEN;
      default:
        return _emergencyEN;
    }
  }

  //voting
  static String voteToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return voteFI;
        break;
      case Language.EN:
        return voteEN;
        break;
      default:
        return voteEN;
        break;
    }
  }

  static const String _votedYesFI = "You voted yes";
  static const String _votedNoFI = "You voted no";
  static const String _votedYesEN = "You voted yes";
  static const String _votedNoEN = "You voted no";

  static String votedYesToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _votedYesFI;
        break;
      case Language.EN:
        return _votedYesEN;
        break;
      default:
        return _votedYesEN;
        break;
    }
  }

  static String votedNoToLozalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return _votedNoFI;
        break;
      case Language.EN:
        return _votedNoEN;
        break;
      default:
        return _votedNoEN;
        break;
    }
  }
}
