import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/Inputs/boxed_form_confirmpw.dart';
import 'package:cityprog/widgets/Inputs/boxed_form_email.dart';
import 'package:cityprog/widgets/Inputs/boxed_form_password.dart';
import 'package:cityprog/widgets/Inputs/icon_form_input.dart';
import 'package:cityprog/widgets/links/centered_text.dart';
import 'package:cityprog/widgets/links/header_text.dart';
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

  int totalPage = 4;

  void _onScroll() {
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
                  BoxedFormEmail(hint: "Email", validationText: "Insert a proper email",),
                  BoxedFormPassword(hint: "Password", validationText: "Password cannot be empty", passwordController: _passwordController),
                  BoxedFormConfirmPw(hint: "Repeat Password", validationText: "Please make sure passwords match", passwordController: _passwordController),
                  ],),),),
            info: CenteredText(text: "More info", color:  AppColor.primary.color()),
          ),
          makePage(
            page: 2,
            title: 'Personal Information',
            header: HeaderText(text: "Personal Information", fontsize: 30, color: AppColor.secondary.color()),
            body: SingleChildScrollView(child: Form(
                  child: Column(children: [
                  IconFormInput(hint: "First Name", validationText: "You failed", icon: Icon(Icons.face)),
                  IconFormInput(hint: "Surname", validationText: "Yes you did", icon: Icon(Icons.person_pin)),
                  IconFormInput(hint: "Birthday", validationText: "Nono", icon: Icon(Icons.cake)),
                  IconFormInput(hint: "Area", validationText: "Nono", icon: Icon(Icons.add_location)),
                  IconFormInput(hint: "Address", validationText: "Nono", icon: Icon(Icons.email)),
                  IconFormInput(hint: "Postal Code", validationText: "Nono", icon: Icon(Icons.code)),
                  ],),),),
            info: CenteredText(text: "More information", color:  AppColor.primary.color()),
          ),
          makePage(
            page: 3,
            title: 'Special Needs',
            header: HeaderText(text: "Personal Information", fontsize: 30, color: AppColor.secondary.color()),
            body: StreamBuilderExample(myQuery: 'Tapahtumat',),
            info: CenteredText(text: "More information", color:  AppColor.primary.color()),
          ),
          makePage(
            page: 4,
            title: 'Example',
            header: HeaderText(text: "Example", fontsize: 30, color: AppColor.secondary.color()),
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