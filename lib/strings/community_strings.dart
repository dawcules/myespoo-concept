import '../current_language.dart';
import './string_provider.dart' show Language;

enum Weekday { MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SUNDAY, SATURDAY }

extension WeekdayString on Weekday {
  String toLocalizedString() {
    switch (this) {
      case Weekday.MONDAY:
        switch (CurrentLanguage.value) {
          case Language.FI:
            return LocalizedCommunityStrings.mondayFI;
          case Language.EN:
            return LocalizedCommunityStrings.mondayEN;
          default:
            return LocalizedCommunityStrings.mondayEN;
        }
        break;
      case Weekday.TUESDAY:
        switch (CurrentLanguage.value) {
          case Language.FI:
            return LocalizedCommunityStrings.tuesdayFI;
          case Language.EN:
            return LocalizedCommunityStrings.tuesdayEN;
          default:
            return LocalizedCommunityStrings.tuesdayEN;
        }
        break;
      case Weekday.WEDNESDAY:
        switch (CurrentLanguage.value) {
          case Language.FI:
            return LocalizedCommunityStrings.wednesdayFI;
          case Language.EN:
            return LocalizedCommunityStrings.wednesdayEN;
          default:
            return LocalizedCommunityStrings.wednesdayEN;
        }
        break;
      case Weekday.THURSDAY:
        switch (CurrentLanguage.value) {
          case Language.FI:
            return LocalizedCommunityStrings.thursdayFI;
          case Language.EN:
            return LocalizedCommunityStrings.thursdayEN;
          default:
            return LocalizedCommunityStrings.thursdayEN;
        }
        break;
      case Weekday.FRIDAY:
        switch (CurrentLanguage.value) {
          case Language.FI:
            return LocalizedCommunityStrings.fridayFI;
          case Language.EN:
            return LocalizedCommunityStrings.fridayEN;
          default:
            return LocalizedCommunityStrings.fridayEN;
        }
        break;
      case Weekday.SUNDAY:
        switch (CurrentLanguage.value) {
          case Language.FI:
            return LocalizedCommunityStrings.fridayFI;
          case Language.EN:
            return LocalizedCommunityStrings.fridayEN;
          default:
            return LocalizedCommunityStrings.fridayEN;
        }
        break;
      case Weekday.SATURDAY:
        switch (CurrentLanguage.value) {
          case Language.FI:
            return LocalizedCommunityStrings.fridayFI;
          case Language.EN:
            return LocalizedCommunityStrings.fridayEN;
          default:
            return LocalizedCommunityStrings.fridayEN;
        }
        break;
    }
  }
}

// Community specific strings for widget texts etc

class LocalizedCommunityStrings {
  // FIN
  static const String sellFI = "Myy";
  static const String buyFI = "Osta";
  static const String browseFI = "Selaa";
  static const String allFI = "Kaikki";
  static const String contactFI = "Ota yhteyttä";
  static const String buyingFI = "Ostetaan";
  static const String sellingFI = "Myydään";
  static const String freeFI = "Ilmainen";
  static const String offerFI = "Tarjoa";
  static const String askFI = "Pyydä";
  static const String offeringFI = "Tarjotaan";
  static const String askingFI = "Pyydetään";
  static const String todayFI = "Tänään";
  static const String tomorrowFI = "Huomenna";
  static const String yesterdayFI = "Eilen";
  static const String fromFI = "Mistä";
  static const String destinationFI = "Minne";
  static const String mondayFI = "Maanantai";
  static const String tuesdayFI = "Tiistai";
  static const String wednesdayFI = "Keskiviikko";
  static const String thursdayFI = "Torstai";
  static const String fridayFI = "Perjantai";
  static const String saturdayFI = "Lauantai";
  static const String sundayFI = "Sunnuntai";
  static const String moreFI = "Lisää";

  // ENG
  static const String sellEN = "Sell";
  static const String buyEN = "Buy";
  static const String browseEN = "Browse";
  static const String allEN = "All";
  static const String contactEN = "Contact";
  static const String buyingEN = "Buying";
  static const String sellingEN = "Selling";
  static const String freeEN = "Free";
  static const String offerEN = "Offer";
  static const String askEN = "Ask";
  static const String offeringEN = "Offering";
  static const String askingEN = "Asking";
  static const String todayEN = "Today";
  static const String tomorrowEN = "Tomorrow";
  static const String yesterdayEN = "Yesterday";
  static const String fromEN = "From";
  static const String destinationEN = "To";
  static const String mondayEN = "Monday";
  static const String tuesdayEN = "Tuesday";
  static const String wednesdayEN = "Wednesday";
  static const String thursdayEN = "Thursday";
  static const String fridayEN = "Friday";
  static const String saturdayEN = "Saturday";
  static const String sundayEN = "Sunday";
  static const String moreEN = "More";

  static String sellToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return sellFI;
        break;
      case Language.EN:
        return sellEN;
        break;
      default:
        return sellEN;
        break;
    }
  }

  static String buyToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return buyFI;
        break;
      case Language.EN:
        return buyEN;
        break;
      default:
        return buyEN;
        break;
    }
  }

  static String browseToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return browseFI;
        break;
      case Language.EN:
        return browseEN;
        break;
      default:
        return browseEN;
        break;
    }
  }

  static String allToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return allFI;
        break;
      case Language.EN:
        return allEN;
        break;
      default:
        return allEN;
        break;
    }
  }

  static String contactToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return contactFI;
        break;
      case Language.EN:
        return contactEN;
        break;
      default:
        return contactEN;
        break;
    }
  }

  static String buyingToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return buyingFI;
        break;
      case Language.EN:
        return buyingEN;
        break;
      default:
        return buyingEN;
        break;
    }
  }

  static String sellingToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return sellingFI;
        break;
      case Language.EN:
        return sellingEN;
        break;
      default:
        return sellingEN;
        break;
    }
  }

  static String freeToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return freeFI;
        break;
      case Language.EN:
        return freeEN;
        break;
      default:
        return freeEN;
        break;
    }
  }

  static String offerToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return offerFI;
        break;
      case Language.EN:
        return offerEN;
        break;
      default:
        return offerEN;
        break;
    }
  }

  static String askToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return askFI;
        break;
      case Language.EN:
        return askEN;
        break;
      default:
        return askEN;
        break;
    }
  }

  static String offeringToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return offeringFI;
        break;
      case Language.EN:
        return offeringEN;
        break;
      default:
        return offeringEN;
        break;
    }
  }

  static String askingToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return askingFI;
        break;
      case Language.EN:
        return askingEN;
        break;
      default:
        return askingEN;
        break;
    }
  }

  static String todayToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return todayFI;
        break;
      case Language.EN:
        return todayEN;
        break;
      default:
        return todayEN;
        break;
    }
  }

  static String tomorrowToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return tomorrowFI;
        break;
      case Language.EN:
        return tomorrowEN;
        break;
      default:
        return tomorrowEN;
        break;
    }
  }

  static String yesterdayToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return yesterdayFI;
        break;
      case Language.EN:
        return yesterdayEN;
        break;
      default:
        return yesterdayEN;
        break;
    }
  }

  static String fromToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return fromFI;
        break;
      case Language.EN:
        return fromEN;
        break;
      default:
        return fromEN;
        break;
    }
  }

  static String destinationToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return destinationFI;
        break;
      case Language.EN:
        return destinationEN;
        break;
      default:
        return destinationEN;
        break;
    }
  }

  static String moreToLocalized() {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return moreFI;
        break;
      case Language.EN:
        return moreEN;
        break;
      default:
        return moreEN;
        break;
    }
  }

  static String dateTimeToLocaleString(DateTime date, {bool needsHrs = false}) {
    String format = localizeDateFormat(date, needsHours: needsHrs);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return format + " (${todayToLocalized()})";
    } else if (date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day) {
      return format + " (${tomorrowToLocalized()})";
    } else if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return format + " (${yesterdayToLocalized()})";
    } else {
      return format;
    }
  }

  static String localizeDateFormat(DateTime date, {bool needsHours = false}) {
    switch (CurrentLanguage.value) {
      case Language.FI:
        return needsHours ? _fullDateFormatFI(date) : _dateFormatFI(date);
        break;
      case Language.EN:
        return needsHours ? _fullDateFormatEN(date) : _dateFormatEN(date);
        break;
      default:
        return needsHours ? _fullDateFormatEN(date) : _dateFormatEN(date);
        break;
    }
  }

  static String _fullDateFormatFI(DateTime date) {
    return "${_dateFormatHoursMinutesFI(date)} " +
        "${weekDayFromInt(date.weekday).toLocalizedString()} ${_dateFormatFI(date)}";
  }

  static String _fullDateFormatEN(DateTime date) {
    return "${_dateFormatHoursMinutesEN(date)} " +
        "${weekDayFromInt(date.weekday).toLocalizedString()} ${_dateFormatEN(date)}";
  }

  static String _dateFormatHoursMinutesFI(DateTime date) {
    String minute = "${date.minute}";
    if (date.minute < 10) minute = "0" + minute;
    print(minute);
    return "${date.hour}:$minute";
  }

  static String _dateFormatHoursMinutesEN(DateTime date) {
    String minute = "${date.minute}";
    if (date.minute < 10) minute = "0" + minute;
    print(minute);
    return "${date.hour}:$minute";
  }

  static String _dateFormatFI(DateTime date) {
    return "${date.day}.${date.month}.${date.year}";
  }

  static String _dateFormatEN(DateTime date) {
    return "${date.month}/${date.day}/${date.year}";
  }

  static Weekday weekDayFromInt(int day) {
    switch (day) {
      case 1:
        return Weekday.MONDAY;
      case 2:
        return Weekday.TUESDAY;
      case 3:
        return Weekday.WEDNESDAY;
      case 4:
        return Weekday.THURSDAY;
      case 5:
        return Weekday.FRIDAY;
      case 6:
        return Weekday.SATURDAY;
      case 7:
        return Weekday.SUNDAY;
      default:
        return null;
    }
  }
}
