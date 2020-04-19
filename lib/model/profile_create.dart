import 'package:cityprog/widgets/database_model/auth.dart';
import 'package:cityprog/widgets/database_model/database.dart';

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

  String email;
  String password;
  String cfpassword;
  String address;
  String fName;
  String lName;
  String postalAddress;
  String area;
  DateTime birthday;
  


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

  void createProfile() {
    var user = _auth.createAccount(email: email, password: password, name: "$fName $lName");
    var profile = _db.buildProfile(beaconIsSelected, healthcareSelected, communitySelected, helpSelected, eventSelected, uiSelected, notificationsSelected, email, address, fName, lName, postalAddress, area, birthday, selectedHealthcare, selectedCommunity, selectedCommunityAreas, selectedHelp, selectedHelpAreas, selectedEvents, selectedEventAreas);
    _db.createProfile(user, profile);
  }
}