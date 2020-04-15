
class Validation {

  bool emailValidated;
  bool passwordValidated;
  bool repeatpwValidated;
  bool firstnameValidated;
  bool birthdayValidated;
  bool areaValidated;
  bool addressValidated;
  bool postalCodeValidated;

  Validation({
    this.emailValidated = false,
    this.passwordValidated = false,
    this.repeatpwValidated = false,
    this.firstnameValidated = false,
    this.birthdayValidated = false,
    this.areaValidated = false,
    this.addressValidated = false,
    this.postalCodeValidated = false,
    });
    

    bool validateEmail(String value){
      String regex = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(regex);
    return !(value.isNotEmpty && regExp.hasMatch(value));
    }

    bool validatePw(String value){
      return value.length <= 6;
    }

    bool confirmPw(value, passwordController){
       return value.isEmpty || (value.isNotEmpty && value != passwordController);
    }

    bool validate(){
      return emailValidated 
      && passwordValidated 
      && repeatpwValidated 
      && firstnameValidated 
      && birthdayValidated 
      && areaValidated 
      && addressValidated 
      && postalCodeValidated;
    }

}