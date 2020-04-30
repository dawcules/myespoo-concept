import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppImagePicker extends StatefulWidget {
  final Function onImagePicked;
  final Function onImageRemoved;
  final double iconSize;
  AppImagePicker({this.iconSize, this.onImagePicked, this.onImageRemoved});

  @override
  _AppImagePickerState createState() => _AppImagePickerState();
}

class _AppImagePickerState extends State<AppImagePicker> {
  File _selectedFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: _selectedFile == null
            ? IconButton(
                iconSize: widget.iconSize ?? 100,
                icon: Icon(
                  Icons.camera_alt,
                ),
                onPressed: () => _getImage(ImageSource.camera),
              )
            : Column(
                children: <Widget>[
                  Container(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: CircleAvatar(
                          backgroundColor: Colors.black54,
                          child: IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.delete_forever),
                            onPressed: () => _removeImage(),
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: FileImage(
                          _selectedFile,
                        ),
                      ),
                    ),
                    width: double.infinity,
                    height: 400,
                  ),
                ],
              ),
      ),
    );
  }

  void _removeImage() {
    setState(() {
      _selectedFile = null;
      if (widget.onImageRemoved != null) {
        widget.onImageRemoved();
      }
    });
  }

  void _getImage(ImageSource source) async {
    File image = await ImagePicker.pickImage(
        source: source, maxHeight: 400, maxWidth: 400);
    if (image != null) {
      setState(() {
        _selectedFile = image;
        if (widget.onImagePicked != null) {
          widget.onImagePicked(image);
        }
      });
    }
  }
}
