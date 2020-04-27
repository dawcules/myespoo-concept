class OriginDestinationValidator {
  bool _originSelected = false;
  bool _destinationSelected = false;

  set originSelected (bool value) => {
    _originSelected = value
  };

  set destinationSelected (bool value) => {
    _destinationSelected = value
  };

  bool validate() {
    return _originSelected && _destinationSelected;
  }
}