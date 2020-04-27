import 'package:cityprog/model/profile_create.dart';
import 'package:cityprog/strings/profile_strings.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/validation/validation.dart';
import 'package:cityprog/widgets/Inputs/dropdownstream.dart';
import 'package:cityprog/widgets/Inputs/icon_form_confirmpw.dart';
import 'package:cityprog/widgets/Inputs/icon_form_input.dart';
import 'package:cityprog/widgets/Inputs/icon_form_password.dart';
import 'package:cityprog/widgets/Inputs/icon_multiline_input.dart';
import 'package:cityprog/widgets/buttons/login_button.dart';
import 'package:cityprog/widgets/buttons/navigationbutton.dart';
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:cityprog/widgets/filters/chip_filter.dart';
import 'package:cityprog/widgets/filters/streamforfilter.dart';
import 'package:cityprog/widgets/links/centered_text.dart';
import 'package:cityprog/widgets/texts/body_text.dart';
import 'package:cityprog/widgets/texts/header_text.dart';
import 'package:cityprog/widgets/switches/profile_switch.dart';
import 'package:fb_auth/fb_auth.dart';
import 'package:flutter/material.dart';
import 'package:cityprog/animations/FadeAnimation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/Backgrounds/background_widget.dart';
import 'package:flutter/foundation.dart' show kIsWeb;



class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  PageController _pageController;
  int index;
  Icon areaIcon = Icon(Icons.local_activity, color: AppColor.hint.color());
  Icon birthdayIcon = Icon(Icons.calendar_today, color: AppColor.hint.color());

  Validation formValidation = new Validation();
  ProfileCreate profileCreate = new ProfileCreate();

  int totalPage = 9;

  void _onScroll() {
  }

  bool otherCondition(index, selected) {
     if (selected.contains(index)) {
                    return true;
                  } else {      
                    return false;
                  }
  }

  void selectArea(selected){
    print(selected);
    setState(() {
      ProfileCreate().area = selected;
      areaIcon = Icon(Icons.local_activity, color: AppColor.primary.color());
    });
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
      case "safety":  setState(() {profileCreate.securitySelected = newValue;});
      break;
      default: print("no switch selected");
    }
  }

  
  void _validateSubmit({context, state}){
    profileCreate.takeValues();
    if(ProfileCreate().profileValidation()){
      print("creating!!");
      profileCreate.createAccount();
      _navigate();
      } 
    else{
        print("Horrifyingly bad profilemaking");
      } 
  }

  void _navigate(){
    Navigator.of(context).pushNamed("/home");
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: ProfileCreate().selectedDate,
        firstDate: DateTime(1920, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != ProfileCreate().selectedDate)
      setState(() {
        ProfileCreate().selectedDate = picked;
      });
  }

  void nextPage(index){
    _pageController.jumpToPage(index+1);
  }
  void previousPage(index){
    _pageController.jumpToPage(index-1);
    if(index == 0){
      Navigator.of(context).pushNamed("/login");
    }
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
      body: Center(
        child: Container(
          height: 1000,
          width: 750,
          child: PageView(
            controller: _pageController,
            children: <Widget>[
              makePage(
                page: 1,
                title: ProfileStrings.p1HeaderToLocalized(),
                header: HeaderText(text: ProfileStrings.p1HeaderToLocalized(), fontsize: 30, color: AppColor.secondary.color()),
                body: SingleChildScrollView(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      IconFormInput(hint: ProfileStrings.emailToLocalized(), validationText: ProfileStrings.emailValidationToLocalized(),validation: formValidation.validateEmail, icon: Icon(Icons.alternate_email),controller: profileCreate.emailController,),
                      IconFormPassword(hint: ProfileStrings.passwordToLocalized(), validationText: ProfileStrings.passwordValidationToLocalized(), validation: formValidation.validatePw ,passwordController: profileCreate.passwordController, icon: Icon(Icons.security)),
                      IconFormConfirm(hint: ProfileStrings.cfPasswordToLocalized(), validationText: ProfileStrings.cfPasswordValidationToLocalized(), validation: formValidation.confirmPw, passwordController: profileCreate.passwordController,icon: Icon(Icons.security), controller: ProfileCreate().cfpasswordController,),
                      ],),),
                info: CenteredText(text: ProfileStrings.moreInfoToLocalized(), color:  AppColor.primary.color()),
              ),
              makePage(
                page: 2,
                title: ProfileStrings.p2HeaderToLocalized(),
                header: HeaderText(text: ProfileStrings.p2HeaderToLocalized(), fontsize: 30, color: AppColor.secondary.color()),
                body: SingleChildScrollView(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround, 
                      children: [
                      BodyText(text: ProfileStrings.p2infoTextToLocalized(), fontsize: 15, color: AppColor.darkText.color() ),
                      SizedBox(height: 10,),
                      IconFormInput(hint: ProfileStrings.fNameToLocalized(), validationText: ProfileStrings.fNameValidationToLocalized(), validation: formValidation.validateText, icon: Icon(Icons.face), controller: profileCreate.fNameController,),
                      IconFormInput(hint: ProfileStrings.lNameToLocalized(), validationText: ProfileStrings.lNameValidationToLocalized(),validation: formValidation.validateText, icon: Icon(Icons.person_pin),controller: profileCreate.lNameController,),
                      IconFormInput(hint: ProfileStrings.addressToLocalized(), validationText: ProfileStrings.addressValidationToLocalized(),validation: formValidation.validateText, icon: Icon(Icons.email), controller: profileCreate.addressController,),
                      IconFormInput(hint: ProfileStrings.postalCodeToLocalized(), validationText: ProfileStrings.postalCodeValidationToLocalized(),validation: formValidation.validateText, icon: Icon(Icons.code),controller: profileCreate.postalController,),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.calendar_today),
                          SizedBox(width: 20,),
                          Text("${ProfileCreate().selectedDate}".split(' ')[0] , style: TextStyle(color: AppColor.darkText.color(),fontSize: 20,), ),
                          SizedBox(width: 20.0,),
                          RaisedButton(
                            onPressed: () => _selectDate(context),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                            color: AppColor.button.color(),
                            child: Text('SYNTYNYT', style: TextStyle(color: AppColor.whiteText.color(),),),
                                ),
                          ],
                      ),                 
                      SizedBox(height: 20,),
                      DropDownStream(onSelected: selectArea, selected: profileCreate.area, myQuery: Database().getCollection("Areas"), hint: ProfileStrings.areaToLocalized(), icon: areaIcon),
                      ],),),
                info: CenteredText(text: ProfileStrings.moreInfoToLocalized(), color:  AppColor.primary.color()),
              ),
              makePage(
                page: 3,
                title: ProfileStrings.p3headerToLocalized(),
                header: HeaderText(text: ProfileStrings.p3headerToLocalized(), fontsize: 30, color: AppColor.secondary.color()),
                body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        BodyText(text: ProfileStrings.p3infoTextToLocalized(), fontsize: 15, color: AppColor.darkText.color() ),
                        SizedBox(height: 10,),
                        ProfileSwitch(
                        label: BodyText(text: ProfileStrings.enhancedMedToLocalized(), fontsize: 15, color: AppColor.darkText.color() ),
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        value: profileCreate.healthcareSelected,
                        category: "healthcare",
                        icon: Icon(Icons.add_alert),
                        onChanged: switchStateTracker,),
                        SizedBox(height: 20,),
                        profileCreate.healthcareSelected != true ? SizedBox(height: 20,) : ChipFilter(onSelected: selectPicker, data: profileCreate.healthcare, selected: profileCreate.selectedHealthcare,),
                        SizedBox(height: 20,),
                        otherCondition("Other", profileCreate.selectedHealthcare) && profileCreate.healthcareSelected == true ? IconMultiInput(hint: ProfileStrings.otherMedToLocalized(), validationText: "Please insert something", icon: Icon(Icons.local_hospital),controller: ProfileCreate().otherConditionController,)  : SizedBox(height: 20,),
                      ],),),
                info: CenteredText(text: "More information", color:  AppColor.primary.color()),
              ),
                makePage(
                page: 4,
                title: ProfileStrings.p4headerToLocalized(),
                header: HeaderText(text: ProfileStrings.p4headerToLocalized(), fontsize: 30, color: AppColor.secondary.color()),
                body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BodyText(text: ProfileStrings.p4InfoTextToLocalized(), fontsize: 15, color: AppColor.darkText.color() ),
                        SizedBox(height: 20,),
                        ProfileSwitch(
                        label: BodyText(text: ProfileStrings.healthBeaconToLocalized(), fontsize: 15, color: AppColor.darkText.color() ),
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        value: profileCreate.beaconIsSelected ,
                        category: "emergency",
                        icon: Icon(Icons.add_alert),
                        onChanged: switchStateTracker,),
                        SizedBox(height: 20,),
                        BodyText(text: ProfileStrings.p4InfoText2ToLocalized(), fontsize: 15, color: AppColor.darkText.color() ),
                        SizedBox(height: 20,),
                        ProfileSwitch(
                        label: BodyText(text: ProfileStrings.safetyBeaconToLocalized(), fontsize: 15, color: AppColor.darkText.color() ),
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        value: profileCreate.securitySelected ,
                        category: "safety",
                        icon: Icon(Icons.verified_user),
                        onChanged: switchStateTracker,),
                ],),
                info: CenteredText(text: ProfileStrings.moreInfoToLocalized(), color:  AppColor.primary.color()),
              ),
              makePage(
                page: 5,
                title: ProfileStrings.p5headerToLocalized(),
                header: HeaderText(text: ProfileStrings.p5headerToLocalized(), fontsize: 30, color: AppColor.secondary.color()),
                body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        BodyText(text: ProfileStrings.p5InfoTextToLocalized(), fontsize: 15, color: AppColor.darkText.color() ),
                        SizedBox(height: 10,),    
                        ProfileSwitch(
                        label: BodyText(text: ProfileStrings.communityToLocalized(), fontsize: 15, color: AppColor.darkText.color() ),
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
                        BodyText(text: ProfileStrings.areaToLocalized(), fontsize: 15, color: AppColor.darkText.color()),
                        SizedBox(height: 20,), 
                        StreamForFilter(onSelected: selectPicker, selected: profileCreate.selectedCommunityAreas, myQuery: "Areas",)]
                        ): SizedBox(height: 20,),
                      ],),),
                info: CenteredText(text: ProfileStrings.moreInfoToLocalized(), color:  AppColor.primary.color()),
              ),
               makePage(
                page: 6,
                title: ProfileStrings.p6headerToLocalized(),
                header: HeaderText(text: ProfileStrings.p6headerToLocalized(), fontsize: 30, color: AppColor.secondary.color()),
                body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        BodyText(text: ProfileStrings.p6InfoTextToLocalized(), fontsize: 15, color: AppColor.darkText.color() ),
                        SizedBox(height: 10,),
                        ProfileSwitch(
                        label: BodyText(text: ProfileStrings.p6InfoText2ToLocalized(), fontsize: 15, color: AppColor.darkText.color() ),
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        value: profileCreate.helpSelected,
                        category: "help",
                        icon: Icon(Icons.healing),
                        onChanged: switchStateTracker,),
                        SizedBox(height: 20,),
                        profileCreate.helpSelected != true ? SizedBox(height: 20,) : ChipFilter(onSelected: selectPicker, data: profileCreate.help, selected: profileCreate.selectedHelp,),
                        SizedBox(height: 20,),
                        profileCreate.helpSelected == true && profileCreate.selectedHelp.length > 0 ?
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,  
                        children: [BodyText(text: ProfileStrings.areaToLocalized(), fontsize: 15, color: AppColor.darkText.color()),
                        SizedBox(height: 20,), 
                        StreamForFilter(onSelected: selectPicker, selected: profileCreate.selectedHelpAreas, myQuery: "Areas",)]
                        ): SizedBox(height: 20,),
                      ],),),
                info: CenteredText(text: ProfileStrings.moreInfoToLocalized(), color:  AppColor.primary.color()),
              ),
               makePage(
                page: 7,
                title: ProfileStrings.p7headerToLocalized(),
                header: HeaderText(text: ProfileStrings.p7headerToLocalized(), fontsize: 30, color: AppColor.secondary.color()),
                body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        BodyText(text: ProfileStrings.p7InfoTextToLocalized(), fontsize: 15, color: AppColor.darkText.color() ),
                        SizedBox(height: 10,),
                        ProfileSwitch(
                        label: BodyText(text: ProfileStrings.p7InfoText2ToLocalized(), fontsize: 15, color: AppColor.darkText.color() ),
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        value: profileCreate.eventSelected,
                        category: "events",
                        icon: Icon(Icons.event),
                        onChanged: switchStateTracker,),
                        SizedBox(height: 20,),
                        profileCreate.eventSelected != true ? SizedBox(height: 20,) : ChipFilter(onSelected: selectPicker, data: profileCreate.events, selected: profileCreate.selectedEvents,),
                        SizedBox(height: 20,),
                        profileCreate.eventSelected == true && profileCreate.selectedEvents.length > 0 ?
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,  
                        children: [BodyText(text: "Areas", fontsize: 15, color: AppColor.darkText.color()),
                        SizedBox(height: 20,), 
                        StreamForFilter(onSelected: selectPicker, selected: profileCreate.selectedEventAreas, myQuery: "Areas",)]
                        ): SizedBox(height: 20,),
                      ],),),
                info: CenteredText(text: ProfileStrings.moreInfoToLocalized(), color:  AppColor.primary.color()),
              ),
              makePage(
                page: 8,
                title: ProfileStrings.p8headerToLocalized(),
                header: HeaderText(text: ProfileStrings.p8headerToLocalized(), fontsize: 30, color: AppColor.secondary.color()),
                body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        BodyText(text: ProfileStrings.p8InfoTextToLocalized(), fontsize: 15, color: AppColor.darkText.color() ),
                        SizedBox(height: 20,),
                        ProfileSwitch(
                        label: !profileCreate.uiSelected  ? BodyText(text: ProfileStrings.traditionalToLocalized(), fontsize: 15, color: AppColor.darkText.color())
                        : BodyText(text: ProfileStrings.modernToLocalized(), fontsize: 15, color: AppColor.darkText.color()),
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        value: profileCreate.uiSelected,
                        category: "UI",
                        icon: Icon(Icons.event),
                        onChanged: switchStateTracker,),
                        SizedBox(height: 20,),
                        Center(child: Image(height: 350,
                        image: !profileCreate.uiSelected  ? AssetImage("assets/images/smartespoowelcome.png") : AssetImage("assets/images/profile.png"))),
                      ],),),
                info: CenteredText(text: ProfileStrings.moreInfoToLocalized(), color:  AppColor.primary.color()),
              ),
               makePage(
                page: 9,
                title: ProfileStrings.p9headerToLocalized(),
                header: HeaderText(text: ProfileStrings.p9headerToLocalized(), fontsize: 30, color: AppColor.secondary.color()),
                body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        BodyText(text: ProfileStrings.p9infoTextToLocalized(), fontsize: 15, color: AppColor.darkText.color() ),
                        SizedBox(height: 10,),
                        ProfileSwitch(
                        label: BodyText(text: ProfileStrings.p9infoText2ToLocalized(), fontsize: 15, color: AppColor.darkText.color() ),
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        value: profileCreate.notificationsSelected,
                        category: "notifications",
                        icon: Icon(Icons.event),
                        onChanged: switchStateTracker,),
                        SizedBox(height: 40,),
                        BodyText(text: ProfileStrings.p9infoText3ToLocalized(), fontsize: 15, color: AppColor.darkText.color() ),
                        SizedBox(height: 100,),
                        LoginButton(text: ProfileStrings.submitToLocalized(), validateSubmit:_validateSubmit,)
                      ],),),
                info: CenteredText(text: ProfileStrings.moreInfoToLocalized(), color:  AppColor.primary.color()),
              )
            ],
          ),
        ),
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
                kIsWeb ? SizedBox(height: 200, width: 200,) : BackgroundWidget(heigth: heigth/4.5, width: width+30, imageUrl: "assets/images/backgroundtesting.png",),
                kIsWeb ? BackgroundWidget(top: 40, heigth: 100, width: 150, imageUrl: "assets/images/smartespoo.png",) : BackgroundWidget(top:-10,heigth: heigth/5, width: width/2, imageUrl: "assets/images/backgroundmyespoo.png",)
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
          kIsWeb ? Stack(children: <Widget>[
             Align(
            alignment: FractionalOffset.centerRight,
            child: index+1 < totalPage ? NavigationButton(icon: Icon(Icons.arrow_forward),text: "Forward", function: nextPage, index: index,): SizedBox(),
            ),
          Align(
            alignment: FractionalOffset.centerLeft,
            child: NavigationButton(icon: Icon(Icons.arrow_back),text: "Previous", function: previousPage, index: index,),
            ),
          ],) : SizedBox(),
          Stack(children: <Widget>[
          Align( 
                alignment: FractionalOffset.bottomCenter,
                child: FadeAnimation(2, info),
          ),
          Align( 
                alignment: FractionalOffset.bottomRight,
                child: Padding(padding: EdgeInsets.all(10),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  FadeAnimation(2, Text(page.toString(), style: TextStyle(color: AppColor.secondary.color(), fontSize: 30, fontWeight: FontWeight.bold),)),
                  Text('/' + totalPage.toString(), style: TextStyle(color: Colors.blue, fontSize: 15),),
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