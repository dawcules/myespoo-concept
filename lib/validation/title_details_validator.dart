class TitleDetailsValidator {
  bool _titleValidated = false;
  bool _detailsValidated = false;

  TitleDetailsValidator();

  bool validateDetails(String value) {
    _titleValidated = value.length > 10;
    return (value.length < 10);
  }

  bool validateTitle(String value) {
    _detailsValidated = value.length > 5;
    return (value.length < 5);
  }

  bool validate() {
    return (_titleValidated && _detailsValidated);
  }
}
