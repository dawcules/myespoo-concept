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

  // Random FIN
  static String _noTitleFi = "Ei otsikkoa";
  static String _allCategoriesFI = "Kaikki kategoriat";
  static String _helpServicesFI = "Apupalvelut";

  // Random ENG
  static String _noTitleEN = "No title";
  static String _allCategoriesEN = "All categories";
  static String _helpServicesEN = "Help services";

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
}
