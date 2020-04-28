import 'dart:io';

import 'package:cityprog/strings/localized_report_strings.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/validation/report_form_validator.dart';
import 'package:cityprog/widgets/Inputs/address_picker.dart';
import 'package:cityprog/widgets/camera/app_image_picker.dart';
import 'package:cityprog/widgets/carpool_marketplace/forms/custom_expansion_tile.dart';
import 'package:cityprog/widgets/columns/title_details_column.dart';
import 'package:cityprog/widgets/posts/community_post_modal.dart';
import 'package:flutter/material.dart';
import 'package:sliding_button/sliding_button.dart';
import 'package:toast/toast.dart';

class ReportForm extends StatefulWidget {
  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final ReportFormValidator _validator = ReportFormValidator();
  final GlobalKey<SlidingButtonState> _slideButtonKey =
      GlobalKey<SlidingButtonState>();
  final TextStyle textStyle = TextStyle(
    fontSize: 16,
  );
  final TextStyle btnTextStyle = TextStyle(
    fontSize: 28,
    color: AppColor.buttonText.color(),
  );

  String _address;

  bool _didSend = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: CommunityPostModal(
        _buildForm(context),
        title: LocalizedReportStrings.reportBrokenToLocalized(),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Container(
        child: SizedBox(
          child: Scrollbar(
            child: Column(
              children: <Widget>[
                Text(
                  LocalizedReportStrings.reportFormDescriptionToLocalized(),
                  style: textStyle,
                ),
                Padding(padding: EdgeInsets.all(8)),
                AppImagePicker(
                  onImagePicked: (File image) => _onImagePicked(image),
                  onImageRemoved: () => _onImageRemoved(),
                ),
                AddressPicker(
                  onAddressPicked: (String address) =>
                      _onAddressPicked(address),
                ),
                CustomExpansionTile(
                  title:
                      Text(LocalizedReportStrings.additionalInfoToLocalized()),
                  children: <Widget>[
                    TitleDetailsColumn(),
                  ],
                ),
                Padding(padding: EdgeInsets.all(8)),
                _didSend
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("${LocalizedReportStrings.sentToLocalized()}!",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: Icon(Icons.check_box,
                                color: AppColor.button.color()),
                            iconSize: 50,
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      )
                    : SlidingButton(
                        key: _slideButtonKey,
                        buttonText: LocalizedReportStrings.sendToLocalized(),
                        buttonColor: AppColor.button.color(),
                        radius: 50,
                        buttonHeight: 80,
                        slideButtonIcon: Icons.mail_outline,
                        slideButtonIconColor: AppColor.button.color(),
                        onSlideSuccessCallback: () => _onSucces(context),
                        widgetWhenSlideIsCompleted: CircularProgressIndicator(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onImagePicked(File image) {
    _validator.hasFile = true;
  }

  void _onImageRemoved() {
    _validator.hasFile = false;
  }

  void _onAddressPicked(String address) {
    _validator.hasAddress = true;
    _address = address;
  }

  void _onSucces(BuildContext context) {
    if (_validator.validate()) {
      Future.delayed(
        Duration(seconds: 2),
        () => {setState(() => _didSend = true), print(_address)},
      );
    } else {
      _slideButtonKey.currentState.reset();
      Toast.show("Täytyä kentät", context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
    }
  }
}
