import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage {
  late final BuildContext context;
  File? imageFile;
  Uint8List? imgBytesData;

  final picker = ImagePicker();

  List<XFile>? imageFileList = [];

  double maxWidth = 200;

  late final VoidCallback updateFile;

  PickImage({
    required this.updateFile,
    required this.context,
  });

  Future _selectFromCamera() async {
    try {
      final pickedFile =
          await picker.pickImage(source: ImageSource.camera, imageQuality: 25);

      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        imgBytesData = await pickedFile.readAsBytes();
        updateFile();
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error is $e');
    }
  }

  Future selectFromGallery() async {
    try {
      print('imgaed picked 1');
      final pickedFile =
          await picker.pickImage(source: ImageSource.gallery);
      print('imgaed picked 2');
      
      if (pickedFile != null) {
        print('imgaed picked');
        imageFile = File(pickedFile.path);
        imgBytesData = await pickedFile.readAsBytes();
        updateFile();
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('imgaed picked 2');
      print(e);
    }
  }

  selectImage() {
    if (Platform.isIOS) {
      CupertinoAlertDialog alertDialog = CupertinoAlertDialog(
        title: Text('Profile Image'),
        content: Text('Please select an option to pic image'),
        actions: [
          CupertinoDialogAction(
            child: Text('Camera'),
            onPressed: () async {
              await _selectFromCamera();
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: Text('Gallery'),
            onPressed: () async {
              await selectFromGallery();
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        },
      );
    } else {
      AlertDialog alert = AlertDialog(
        title: Text('Profile Image'),
        content: Text("Please select an option to pic your image."),
        actions: [
          TextButton(
            child: Text("Camera"),
            onPressed: () async {
              await _selectFromCamera();
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: Text("Gallery"),
            onPressed: () async {
              await selectFromGallery();
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }
}
