import 'package:cityprog/widgets/database_model/auth.dart';
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:flutter/material.dart';

class ProfileCreate {

  final _db = Database();
  final _auth = Auth();

  ProfileCreate();

  bool beaconIsSelected = false;
  bool healthcareSelected = false;
  bool communitySelected = false;
  bool helpSelected = false;
  bool eventSelected = false;
  bool uiSelected = false;
  bool notificationsSelected = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
  String birthday;

  var healthcare = ["Wheelchair", "Physical Disability", "Depression", "Mental Disability", "Illness", "Vision impaired", "Other"];
  var selectedHealthcare = [];
  var areas = ["Leppävaara", "Tapiola","Vanha-Espoo", "Matinkylä", "Espoonlahti", "Pohjois Espoo" ];

  var community = ["Carpool", "Marketplace","Recycling", "Local Activities", ];
  var selectedCommunity = [];
  var selectedCommunityAreas= [];


  var help = ["Helping Elderly", "Shoplifting","Being a good guy", "Gardening", ];
  var selectedHelp = [];
  var selectedHelpAreas= [];

  var events = ["Sports", "Culture","Culinary", "Educational", "ETC" ];
  var selectedEvents = [];
  var selectedEventAreas= [];

  void takeValues(){


  email = emailController.text;
  password = passwordController.text;
  cfpassword = passwordController.text;
  address = addressController.text;
  fName = fNameController.text;
  lName = lNameController.text;
  postalAddress = postalController.text;
  area = areaController.text;
  //DATEPICKER
  //birthday = bdayController.text;
  }

  void createProfile() {
    _auth.initAuth();
    _auth.createAccount(email: email, password: password, name: "$fName $lName");
    _auth.login(email: email, password: password);
    _db.createProfile("LAJDALKSHFLIHFIOALHFh3r342534634634h63ljk46lh34l6h34", _db.buildProfile(beaconIsSelected, healthcareSelected, communitySelected, helpSelected, eventSelected, uiSelected, notificationsSelected, email, address, fName, lName, postalAddress, area, birthday, selectedHealthcare, selectedCommunity, selectedCommunityAreas, selectedHelp, selectedHelpAreas, selectedEvents, selectedEventAreas));
  }
}