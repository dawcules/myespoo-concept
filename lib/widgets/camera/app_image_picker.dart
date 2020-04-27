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
    return _selectedFile == null
        ? IconButton(
            iconSize: widget.iconSize ?? 100,
            icon: Icon(
              Icons.camera_alt,
            ),
            onPressed: () => _getImage(ImageSource.camera),
          )
        : Stack(
            children: <Widget>[
              Image.file(_selectedFile),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  iconSize: widget.iconSize ?? 40,
                  icon: Icon(Icons.delete_forever),
                  onPressed: () => _removeImage(),
                ),
              )
            ],
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
    File image = await ImagePicker.pickImage(source: source);
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
