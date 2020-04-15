import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/validation/validation.dart';
import 'package:cityprog/widgets/Inputs/icon_form_confirmpw.dart';
import 'package:cityprog/widgets/Inputs/icon_form_input.dart';
import 'package:cityprog/widgets/Inputs/icon_form_password.dart';
import 'package:cityprog/widgets/Inputs/icon_multiline_input.dart';
import 'package:cityprog/widgets/filters/chip_filter.dart';
import 'package:cityprog/widgets/links/centered_text.dart';
import 'package:cityprog/widgets/texts/body_text.dart';
import 'package:cityprog/widgets/texts/header_text.dart';
import 'package:cityprog/widgets/switches/profile_switch.dart';
import 'package:flutter/material.dart';
import 'package:cityprog/animations/FadeAnimation.dart';
import '../widgets/Backgrounds/background_widget.dart';
//import '../widgets/Inputs/boxedinput.dart';
//import '../widgets/containers/box_container.dart';
import '../widgets/database_widgets/stream_builder_example.dart';



class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  PageController _pageController;
  final _formKey = new GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  Validation formValidation = new Validation();

  bool _beaconIsSelected = false;
  bool _healthcareSelected = false;
  bool _communitySelected = false;


  var healthcare = ["Wheelchair", "Physical Disability", "Depression", "Mental Disability", "Illness", "Vision impaired", "Other"];
  var selectedHealthcare = [];

  var community = ["Carpool", "Marketplace", "Sport communities", "Birdspotting",];
  var selectedCommunity = [];

 

  int totalPage = 6;

  void _onScroll() {
  }

  bool otherCondition(index, selected) {
     if (selected.contains(index)) {
                    return true;
                  } else {      
                    return false;
                  }
  }

  void selectPicker(index,selected){
     if (selected.contains(index)) {
                    selected.remove(index);
                  } else {
                    selected.add(index);
                  }
                  setState(() {});
  }

  void switchStateTracker(bool newValue, String switchCategory) {
    switch(switchCategory){
      case "emergency":  setState(() {_beaconIsSelected = newValue;});
      break;
      case "healthcare": setState(() {_healthcareSelected = newValue;});
      break;
      case "community": setState(() {_communitySelected = newValue;});
      break;
      default: print("no switch selected");
    }
  }
  void switchState(bool newValue, bool selectedSwitch){
  }
   
 

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

    super.initState();
  } 

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background.color(),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
            page: 1,
            title: 'Account Information',
            header: HeaderText(text: "Account Information", fontsize: 30, color: AppColor.secondary.color()),
            body: SingleChildScrollView(child: Form(key: _formKey, 
                  child: Column(children: [
                  IconFormInput(hint: "Email", validationText: "Insert a proper email",validation: formValidation.validateEmail, icon: Icon(Icons.alternate_email),),
                  IconFormPassword(hint: "Password", validationText: "Password cannot be empty", validation: formValidation.validatePw ,passwordController: _passwordController, icon: Icon(Icons.security)),
                  IconFormConfirm(hint: "Repeat Password", validationText: "Please make sure passwords match", validation: formValidation.confirmPw, passwordController: _passwordController,icon: Icon(Icons.security)),
                  ],),),),
            info: CenteredText(text: "More info", color:  AppColor.primary.color()),
          ),
          makePage(
            page: 2,
            title: 'Personal Information',
            header: HeaderText(text: "Personal Information (DEMO)", fontsize: 30, color: AppColor.secondary.color()),
            body: SingleChildScrollView(child: Form(
                  child: Column(children: [
                  BodyText(text: "All of the following is normally done with TUPAS indentification", fontsize: 15, color: AppColor.darkText.color() ),
                  SizedBox(height: 10,),
                  IconFormInput(hint: "First Name", validationText: "You failed", validation: formValidation.validateText, icon: Icon(Icons.face)),
                  IconFormInput(hint: "Surname", validationText: "Yes you did",validation: formValidation.validateText, icon: Icon(Icons.person_pin)),
                  IconFormInput(hint: "Birthday", validationText: "Nono",validation: formValidation.validateText, icon: Icon(Icons.cake)),
                  IconFormInput(hint: "Area", validationText: "Nono",validation: formValidation.validateText, icon: Icon(Icons.add_location)),
                  IconFormInput(hint: "Address", validationText: "Nono",validation: formValidation.validateText, icon: Icon(Icons.email)),
                  IconFormInput(hint: "Postal Code", validationText: "Nono",validation: formValidation.validateText, icon: Icon(Icons.code)),
                  ],),),),
            info: CenteredText(text: "More information", color:  AppColor.primary.color()),
          ),
          makePage(
            page: 3,
            title: 'Healthcare',
            header: HeaderText(text: "Healthcare", fontsize: 30, color: AppColor.secondary.color()),
            body: SingleChildScrollView(child: Form(
                  child: Column(children: [
                    BodyText(text: "We can offer you customized medical services on your approval, also greatly enhance your ability to move around inside a smart city", fontsize: 15, color: AppColor.darkText.color() ),
                    SizedBox(height: 10,),
                    ProfileSwitch(
                    label: BodyText(text: "Enhanced medical services", fontsize: 15, color: AppColor.darkText.color() ),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    value: _healthcareSelected,
                    category: "healthcare",
                    icon: Icon(Icons.add_alert),
                    onChanged: switchStateTracker,),
                    SizedBox(height: 20,),
                    _healthcareSelected != true ? SizedBox(height: 20,) : ChipFilter(onSelected: selectPicker, data: healthcare, selected: selectedHealthcare,),
                     SizedBox(height: 20,),
                    otherCondition("Other", selectedHealthcare) && _healthcareSelected == true ? IconMultiInput(hint: "Describe your condition", validationText: "Please insert something", icon: Icon(Icons.local_hospital),)  : SizedBox(height: 20,),
                  ],),),),
            info: CenteredText(text: "More information", color:  AppColor.primary.color()),
          ),
            makePage(
            page: 4,
            title: 'Emergency Detection',
            header: HeaderText(text: "Emergency Beacon", fontsize: 30, color: AppColor.secondary.color()),
            body: Column(children: [
                    BodyText(text: "Do you need to go to bathroom often?", fontsize: 15, color: AppColor.darkText.color() ),
                    SizedBox(height: 10,),
                    ProfileSwitch(
                    label: BodyText(text: "Apply Emergency Beacon", fontsize: 15, color: AppColor.darkText.color() ),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    value: _beaconIsSelected ,
                    category: "emergency",
                    icon: Icon(Icons.add_alert),
                    onChanged: switchStateTracker,),
            ],),
            info: CenteredText(text: "More information", color:  AppColor.primary.color()),
          ),
          makePage(
            page: 5,
            title: 'Community',
            header: HeaderText(text: "Community", fontsize: 30, color: AppColor.secondary.color()),
            body: SingleChildScrollView(child: Form(
                  child: Column(children: [
                    BodyText(text: "Would you like to be part of the espoo area community? This includes all kinds of services related to users interacting with each other.", fontsize: 15, color: AppColor.darkText.color() ),
                    SizedBox(height: 10,),
                    ProfileSwitch(
                    label: BodyText(text: "Partake in community activity", fontsize: 15, color: AppColor.darkText.color() ),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    value: _communitySelected,
                    category: "community",
                    icon: Icon(Icons.terrain),
                    onChanged: switchStateTracker,),
                    SizedBox(height: 20,),
                    _communitySelected != true ? SizedBox(height: 20,) : ChipFilter(onSelected: selectPicker, data: community, selected: selectedCommunity,),
                     SizedBox(height: 20,),
                    otherCondition("OTHER", selectedCommunity) && _communitySelected == true ? IconMultiInput(hint: "Describe your condition", validationText: "Please insert something", icon: Icon(Icons.present_to_all),)  : SizedBox(height: 20,),
                  ],),),),
            info: CenteredText(text: "More information", color:  AppColor.primary.color()),
          ),
          makePage(
            page: 6,
            title: 'Practice Zone',
            header: HeaderText(text: "Practice Zone", fontsize: 30, color: AppColor.secondary.color()),
            body: Text("Still sucking"),
            info: CenteredText(text: "More information", color:  AppColor.primary.color()),
          ),
           makePage(
            page: 7,
            title: 'Example Database fetch list',
            header: HeaderText(text: "Database Steambuilder example", fontsize: 30, color: AppColor.secondary.color()),
            body: StreamBuilderExample(myQuery: 'Tapahtumat',),
            info: CenteredText(text: "More information", color:  AppColor.primary.color()),
          ),
        ],
      ),
    );
  }

  Widget makePage({ title, image, header, body, info, page}) {
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;
    return Container(
        child: Column(
        children: <Widget>[
          Container(
            height: heigth/5,
            child: Stack(
              children: <Widget>[
                BackgroundWidget(heigth: heigth/5, width: width+30, imageUrl: "assets/images/backgroundtesting.png",),
                BackgroundWidget(top: 40, heigth: heigth/10, width: width/3, imageUrl: "assets/images/smartespoo.png",)
              ],
            ),
          ),
          SizedBox(height:10),
          Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(1.5,
                header),
                SizedBox(height:20),
                Expanded(child: FadeAnimation(1.6,body)),
                SizedBox(height:20),
              ],
            ),
          ),
          ),
          Stack(children: <Widget>[
          Align( 
                alignment: FractionalOffset.bottomCenter,
                child:  FadeAnimation(2, info),
          ),
          Align( 
                alignment: FractionalOffset.bottomRight,
                child: Padding(padding: EdgeInsets.all(10),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  FadeAnimation(2, Text(page.toString(), style: TextStyle(color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),)),
                  Text('/' + totalPage.toString(), style: TextStyle(color: Colors.blue, fontSize: 15),)
                ],
              ),
                ),
          ),
          ]
          ),
        ],
        ),
     );
  }
}