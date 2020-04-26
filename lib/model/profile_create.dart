import 'package:cityprog/validation/validation.dart';
import 'package:cityprog/widgets/database_model/auth.dart';
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:flutter/material.dart';

class ProfileCreate {
  
  final _db = Database();
  final _auth = Auth();
  final _validation = Validation();

  ProfileCreate._internal();  
  static final ProfileCreate _instance = ProfileCreate._internal();

  bool _creatingProfile = false;


  bool beaconIsSelected = false;
  bool healthcareSelected = false;
  bool communitySelected = false;
  bool helpSelected = false;
  bool eventSelected = false;
  bool uiSelected = false;
  bool notificationsSelected = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cfpasswordController = TextEditingController();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final postalController = TextEditingController();
  final bdayController = TextEditingController();
  final healthcareController = TextEditingController();
  final areaController = TextEditingController();
  final addressController = TextEditingController();

  String email;
  String password;
  String cfpassword;
  String address;
  String fName;
  String lName;
  String postalAddress;
  String area;
  //TODO. DATEPICKER
  DateTime selectedDate = DateTime.now();
  DateTime birthday;

  List<String> healthcare = ["Wheelchair", "Physical Disability", "Depression", "Mental Disability", "Illness", "Vision impaired", "Other"];
  List<String> selectedHealthcare = [];
  //List<String> areas = ["Leppävaara", "Tapiola","Vanha-Espoo", "Matinkylä", "Espoonlahti", "Pohjois Espoo" ];
  
  List<String> community = ["Carpool", "Marketplace","Recycling", "Local Activities", ];
  List<String> selectedCommunity = [];
  List<String> selectedCommunityAreas= [];


  List<String> help = ["Helping Elderly", "Shoplifting","Being a good guy", "Gardening", ];
  List<String> selectedHelp = [];
  List<String> selectedHelpAreas= [];

  List<String> events = ["Sports", "Culture","Culinary", "Educational", "ETC" ];
  List<String> selectedEvents = [];
  List<String> selectedEventAreas= [];

  void takeValues(){
  email = emailController.text;
  password = passwordController.text;
  cfpassword = cfpasswordController.text;
  address = addressController.text;
  fName = fNameController.text;
  lName = lNameController.text;
  postalAddress = postalController.text;
  birthday = selectedDate;
  }

  bool profileValidation(){
    print(email);
    print(password);
    print(postalAddress);
    if(
      !_validation.validateEmail(email)
      && password == cfpassword
      && !_validation.validatePw(password)
      && area != null
    ){
      return true;
    }
    else{
      return false;
      }
      
  }

  bool isAccountCreating(){
    return _creatingProfile;
  }

  void creatingAccount(){
    _creatingProfile = !_creatingProfile;
  }

  void clearProfile(){
    
  }

  void createAccount(){
    creatingAccount();
    _auth.createAccount(email: email, password: password, name: "$fName $lName");
    _auth.login(email: email, password: password);
  }

  void createProfile({user}) {
    _db.createProfile(user, _db.buildProfile(beaconIsSelected, healthcareSelected, communitySelected, helpSelected, eventSelected, uiSelected, notificationsSelected, email, address, fName, lName, postalAddress, area, birthday, selectedHealthcare, selectedCommunity, selectedCommunityAreas, selectedHelp, selectedHelpAreas, selectedEvents, selectedEventAreas));
  }
  factory ProfileCreate() => _instance;
}