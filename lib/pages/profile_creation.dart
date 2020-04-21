import 'package:cityprog/model/profile_create.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/validation/validation.dart';
import 'package:cityprog/widgets/Inputs/icon_form_confirmpw.dart';
import 'package:cityprog/widgets/Inputs/icon_form_input.dart';
import 'package:cityprog/widgets/Inputs/icon_form_password.dart';
import 'package:cityprog/widgets/Inputs/icon_multiline_input.dart';
import 'package:cityprog/widgets/buttons/login_button.dart';
import 'package:cityprog/widgets/filters/chip_filter.dart';
import 'package:cityprog/widgets/links/centered_text.dart';
import 'package:cityprog/widgets/texts/body_text.dart';
import 'package:cityprog/widgets/texts/header_text.dart';
import 'package:cityprog/widgets/switches/profile_switch.dart';
import 'package:fb_auth/fb_auth.dart';
import 'package:flutter/material.dart';
import 'package:cityprog/animations/FadeAnimation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/Backgrounds/background_widget.dart';
import '../widgets/database_widgets/stream_builder_example.dart';



class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  PageController _pageController;
  int index;

  Validation formValidation = new Validation();
  ProfileCreate profileCreate = new ProfileCreate();

  int totalPage = 10;

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
      case "emergency":  setState(() {profileCreate.beaconIsSelected = newValue;});
      break;
      case "healthcare": setState(() {profileCreate.healthcareSelected = newValue;});
      break;
      case "community": setState(() {profileCreate.communitySelected = newValue;});
      break;
      case "help": setState(() {profileCreate.helpSelected = newValue;});
      break;
      case "events": setState(() {profileCreate.eventSelected = newValue;});
      break;
      case "UI": setState(() {profileCreate.uiSelected = newValue;});
      break;
      case "notifications": setState(() {profileCreate.notificationsSelected = newValue;});
      break;
      default: print("no switch selected");
    }
  }

  
  void _validateSubmit({context, state}){
    profileCreate.takeValues();
    if(ProfileCreate().profileValidation()){
      print("creating!!");
      profileCreate.createAccount();
      _navigate();}
    else{
        print("Horrifyingly bad profilemaking");
      } 
  }

  void _navigate(){
    Navigator.of(context).pushNamed("/home");
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
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) =>
      Scaffold(
      backgroundColor: AppColor.background.color(),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
            page: 1,
            title: 'Account Information',
            header: HeaderText(text: "Account Information", fontsize: 30, color: AppColor.secondary.color()),
            body: SingleChildScrollView(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  IconFormInput(hint: "Email", validationText: "Insert a proper email",validation: formValidation.validateEmail, icon: Icon(Icons.alternate_email),controller: profileCreate.emailController,),
                  IconFormPassword(hint: "Password", validationText: "Password cannot be empty", validation: formValidation.validatePw ,passwordController: profileCreate.passwordController, icon: Icon(Icons.security)),
                  IconFormConfirm(hint: "Repeat Password", validationText: "Please make sure passwords match", validation: formValidation.confirmPw, passwordController: profileCreate.passwordController,icon: Icon(Icons.security), controller: ProfileCreate().cfpasswordController,),
                  ],),),
            info: CenteredText(text: "More info", color:  AppColor.primary.color()),
          ),
          makePage(
            page: 2,
            title: 'Personal Information',
            header: HeaderText(text: "Personal Information (DEMO)", fontsize: 30, color: AppColor.secondary.color()),
            body: SingleChildScrollView(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround, 
                  children: [
                  BodyText(text: "All of the following is normally done with TUPAS indentification", fontsize: 15, color: AppColor.darkText.color() ),
                  SizedBox(height: 10,),
                  IconFormInput(hint: "First Name", validationText: "Please insert a proper first name", validation: formValidation.validateText, icon: Icon(Icons.face), controller: profileCreate.fNameController,),
                  IconFormInput(hint: "Surname", validationText: "Please insert a proper surname",validation: formValidation.validateText, icon: Icon(Icons.person_pin),controller: profileCreate.lNameController,),
                  IconFormInput(hint: "Birthday", validationText: "Please insert a proper birthday",validation: formValidation.validateText, icon: Icon(Icons.cake),controller: profileCreate.bdayController,),
                  IconFormInput(hint: "Area", validationText: "Nono",validation: formValidation.validateText, icon: Icon(Icons.add_location),controller: profileCreate.areaController),
                  IconFormInput(hint: "Address", validationText: "Nono",validation: formValidation.validateText, icon: Icon(Icons.email), controller: profileCreate.addressController,),
                  IconFormInput(hint: "Postal Code", validationText: "Nono",validation: formValidation.validateText, icon: Icon(Icons.code),controller: profileCreate.postalController,),
                  ],),),
            info: CenteredText(text: "More information", color:  AppColor.primary.color()),
          ),
          makePage(
            page: 3,
            title: 'Healthcare',
            header: HeaderText(text: "Healthcare", fontsize: 30, color: AppColor.secondary.color()),
            body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    BodyText(text: "We can offer you customized medical services on your approval, also greatly enhance your ability to move around inside a smart city", fontsize: 15, color: AppColor.darkText.color() ),
                    SizedBox(height: 10,),
                    ProfileSwitch(
                    label: BodyText(text: "Enhanced medical services", fontsize: 15, color: AppColor.darkText.color() ),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    value: profileCreate.healthcareSelected,
                    category: "healthcare",
                    icon: Icon(Icons.add_alert),
                    onChanged: switchStateTracker,),
                    SizedBox(height: 20,),
                    profileCreate.healthcareSelected != true ? SizedBox(height: 20,) : ChipFilter(onSelected: selectPicker, data: profileCreate.healthcare, selected: profileCreate.selectedHealthcare,),
                    SizedBox(height: 20,),
                    otherCondition("Other", profileCreate.selectedHealthcare) && profileCreate.healthcareSelected == true ? IconMultiInput(hint: "Describe your condition", validationText: "Please insert something", icon: Icon(Icons.local_hospital),)  : SizedBox(height: 20,),
                  ],),),
            info: CenteredText(text: "More information", color:  AppColor.primary.color()),
          ),
            makePage(
            page: 4,
            title: 'Emergency Detection',
            header: HeaderText(text: "Emergency Beacon", fontsize: 30, color: AppColor.secondary.color()),
            body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyText(text: "Need hjelp this should probably not be a selectable attribute?", fontsize: 15, color: AppColor.darkText.color() ),
                    SizedBox(height: 10,),
                    ProfileSwitch(
                    label: BodyText(text: "Apply Emergency Beacon", fontsize: 15, color: AppColor.darkText.color() ),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    value: profileCreate.beaconIsSelected ,
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
            body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    BodyText(text: "Would you like to be part of the espoo area community? This includes all kinds of services related to users interacting with each other.", fontsize: 15, color: AppColor.darkText.color() ),
                    SizedBox(height: 10,),
                    ProfileSwitch(
                    label: BodyText(text: "Partake in community activity", fontsize: 15, color: AppColor.darkText.color() ),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    value: profileCreate.communitySelected,
                    category: "community",
                    icon: Icon(Icons.terrain),
                    onChanged: switchStateTracker,),
                    SizedBox(height: 20,),
                    profileCreate.communitySelected != true ? SizedBox(height: 20,) : ChipFilter(onSelected: selectPicker, data: profileCreate.community, selected: profileCreate.selectedCommunity,),
                     SizedBox(height: 20,),
                    otherCondition("Local Activities", profileCreate.selectedCommunity) && profileCreate.communitySelected == true ?
                    Column(  
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    BodyText(text: "Select areas you're fine travelling to.", fontsize: 15, color: AppColor.darkText.color()),
                    SizedBox(height: 20,), 
                    ChipFilter(onSelected: selectPicker, data: profileCreate.areas, selected: profileCreate.selectedCommunityAreas)]
                    ): SizedBox(height: 20,),
                  ],),),
            info: CenteredText(text: "More information", color:  AppColor.primary.color()),
          ),
           makePage(
            page: 6,
            title: 'Help Services',
            header: HeaderText(text: "Project Helping Hand", fontsize: 30, color: AppColor.secondary.color()),
            body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    BodyText(text: "Interested in volunteer work?", fontsize: 15, color: AppColor.darkText.color() ),
                    SizedBox(height: 10,),
                    ProfileSwitch(
                    label: BodyText(text: "What kind?", fontsize: 15, color: AppColor.darkText.color() ),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    value: profileCreate.helpSelected,
                    category: "help",
                    icon: Icon(Icons.healing),
                    onChanged: switchStateTracker,),
                    SizedBox(height: 20,),
                    profileCreate.helpSelected != true ? SizedBox(height: 20,) : ChipFilter(onSelected: selectPicker, data: profileCreate.help, selected: profileCreate.selectedHelp,),
                     SizedBox(height: 20,),
                    profileCreate.helpSelected == true ?
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,  
                    children: [BodyText(text: "Areas", fontsize: 15, color: AppColor.darkText.color()),
                    SizedBox(height: 20,), 
                    ChipFilter(onSelected: selectPicker, data: profileCreate.areas, selected: profileCreate.selectedHelpAreas)]
                    ): SizedBox(height: 20,),
                  ],),),
            info: CenteredText(text: "More information", color:  AppColor.primary.color()),
          ),
           makePage(
            page: 7,
            title: 'Events',
            header: HeaderText(text: "Events", fontsize: 30, color: AppColor.secondary.color()),
            body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    BodyText(text: "Are you interested in being informed about events happening near you?", fontsize: 15, color: AppColor.darkText.color() ),
                    SizedBox(height: 10,),
                    ProfileSwitch(
                    label: BodyText(text: "What kind of events would you be interested in?", fontsize: 15, color: AppColor.darkText.color() ),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    value: profileCreate.eventSelected,
                    category: "events",
                    icon: Icon(Icons.event),
                    onChanged: switchStateTracker,),
                    SizedBox(height: 20,),
                    profileCreate.eventSelected != true ? SizedBox(height: 20,) : ChipFilter(onSelected: selectPicker, data: profileCreate.events, selected: profileCreate.selectedEvents,),
                     SizedBox(height: 20,),
                    profileCreate.eventSelected == true ?
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,  
                    children: [BodyText(text: "Areas", fontsize: 15, color: AppColor.darkText.color()),
                    SizedBox(height: 20,), 
                    ChipFilter(onSelected: selectPicker, data: profileCreate.areas, selected: profileCreate.selectedEventAreas)]
                    ): SizedBox(height: 20,),
                  ],),),
            info: CenteredText(text: "More information", color:  AppColor.primary.color()),
          ),
          makePage(
            page: 8,
            title: "General Settings",
            header: HeaderText(text: "General Settings", fontsize: 30, color: AppColor.secondary.color()),
            body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    BodyText(text: "Which style of UI would you prefer?", fontsize: 15, color: AppColor.darkText.color() ),
                    SizedBox(height: 20,),
                    ProfileSwitch(
                    label: !profileCreate.uiSelected  ? BodyText(text: "Traditional", fontsize: 15, color: AppColor.darkText.color())
                    : BodyText(text: "Modern", fontsize: 15, color: AppColor.darkText.color()),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    value: profileCreate.uiSelected,
                    category: "UI",
                    icon: Icon(Icons.event),
                    onChanged: switchStateTracker,),
                    SizedBox(height: 20,),
                    Center(child: Image(height: 350,
                    image: !profileCreate.uiSelected  ? AssetImage("assets/images/smartespoowelcome.png") : AssetImage("assets/images/profile.png"))),
                  ],),),
            info: CenteredText(text: "More information", color:  AppColor.primary.color()),
          ),
           makePage(
            page: 9,
            title: "Finalizing",
            header: HeaderText(text: "Finalizing", fontsize: 30, color: AppColor.secondary.color()),
            body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    BodyText(text: "Do you wish to receive notifications?", fontsize: 15, color: AppColor.darkText.color() ),
                    SizedBox(height: 10,),
                    ProfileSwitch(
                    label: BodyText(text: "Notifications", fontsize: 15, color: AppColor.darkText.color() ),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    value: profileCreate.notificationsSelected,
                    category: "notifications",
                    icon: Icon(Icons.event),
                    onChanged: switchStateTracker,),
                    SizedBox(height: 40,),
                    BodyText(text: "Thank you for filling out the profile! This will greatly enhance our ability to provide right services for you and should make using the app much more pleasant and useful for you.", fontsize: 15, color: AppColor.darkText.color() ),
                    SizedBox(height: 40,),
                    LoginButton(text: "SUBMIT PROFILE", validateSubmit:_validateSubmit,)
                  ],),),
            info: CenteredText(text: "More information", color:  AppColor.primary.color()),
          ),
          makePage(
            page: 10,
            title: 'Example Database fetch list',
            header: HeaderText(text: "Database Steambuilder example", fontsize: 30, color: AppColor.secondary.color()),
            body: StreamBuilderExample(myQuery: 'Tapahtumat',),
            info: CenteredText(text: "More information", color:  AppColor.primary.color()),
          ),
        ],
      ),
      ),
    );
  }

  Widget makePage({ title, image, header, body, info, page}) {
    index = page-1;
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
                FadeAnimation(0.8,
                header),
                SizedBox(height:20),
                Expanded(child: FadeAnimation(1,body)),
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