class TitleDetailsValidator {
  bool titleValidated = false;
  bool detailsValidated = false;

  bool validateDetails(String value) {
    return (value.length > 10);
  }

  bool validateTitle(String value) {
    return (value.length > 5);
  }

  bool validate() {
    return titleValidated && detailsValidated;
  }
}
