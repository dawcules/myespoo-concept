class TitleDetailsValidator {
  bool _titleValidated = false;
  bool _detailsValidated = false;
  String _title;
  String _details;

  String get title => _title;
  String get details => _details;


  TitleDetailsValidator();

  bool validateDetails(String value) {
    _titleValidated = value.length > 10;
    _details = value;
    return (value.length < 10);
  }

  bool validateTitle(String value) {
    _title = value;
    _detailsValidated = value.length > 5;
    return (value.length < 5);
  }

  bool validate() {
    return (_titleValidated && _detailsValidated);
  }
}
