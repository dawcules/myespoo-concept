import 'dart:io';

import 'package:cityprog/strings/localized_report_strings.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/Inputs/address_picker.dart';
import 'package:cityprog/widgets/columns/title_details_column.dart';
import 'package:cityprog/widgets/posts/community_post_modal.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sliding_button/sliding_button.dart';

class ReportForm extends StatefulWidget {
  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  File _selectedFile;
  final GlobalKey<SlidingButtonState> _slideButtonKey =
      GlobalKey<SlidingButtonState>();
  final TextStyle textStyle = TextStyle(
    fontSize: 16,
  );
  final TextStyle btnTextStyle = TextStyle(
    fontSize: 28,
    color: AppColor.buttonText.color(),
  );

  bool _isExpanded = false;
  bool _didSend = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40, left: 40),
      child: CommunityPostModal(_buildForm(context)),
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
                _selectedFile == null ? IconButton(
                  iconSize: 100,
                  icon: Icon(
                    Icons.camera_alt,
                  ),
                  onPressed: () => getImage(ImageSource.camera),
                ) : Image.file(_selectedFile),
                _isExpanded
                    ? TitleDetailsColumn()
                    : Padding(
                        padding: EdgeInsets.all(0),
                      ),
                FlatButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _isExpanded
                          ? LocalizedReportStrings.hideInputFieldsToLocalized()
                          : LocalizedReportStrings.showInputFieldsToLocalized(),
                      style: textStyle,
                    ),
                  ),
                  onPressed: () => _toggleInputsExpanded(),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  LocalizedReportStrings.reportFormDescriptionToLocalized(),
                  style: textStyle,
                ),
                AddressPicker(),
                Padding(padding: EdgeInsets.all(8)),
                _didSend
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("${LocalizedReportStrings.sentToLocalized()}!",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: Icon(Icons.check_box, color: AppColor.button.color()),
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

  void _onSucces(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),
      () => {
        setState(() => _didSend = true),
      },
    );
  }

  void _toggleInputsExpanded() {
    setState(() => _isExpanded = !_isExpanded);
  }

  getImage(ImageSource source) async {
    File image = await ImagePicker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _selectedFile = image;
      });
    }
  }
}
