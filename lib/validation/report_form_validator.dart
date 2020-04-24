class ReportFormValidator {
  bool _hasFile = false;
  bool _hasAddress = false;

  set hasFile(bool hasFile) {
    _hasFile = hasFile;
  }

  set hasAddress(bool hasAddress) {
    _hasAddress = hasAddress;
  }

  bool validate() {
    return _hasAddress && _hasFile;
  }
}
