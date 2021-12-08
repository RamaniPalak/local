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
      print('image picked 1');
      final pickedFile =
          await picker.pickImage(source: ImageSource.gallery);
      print('image picked 2');
      
      if (pickedFile != null) {
        print('image picked');
        imageFile = File(pickedFile.path);
        imgBytesData = await pickedFile.readAsBytes();
        updateFile();
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('image picked 2');
      print(e);
    }
  }

  selectImage() {
    if (Platform.isIOS) {
      CupertinoAlertDialog alertDialog = CupertinoAlertDialog(
        title: const Text('Profile Image'),
        content: const Text('Please select an option to pick image'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Camera'),
            onPressed: () async {
              Navigator.pop(context);
              await _selectFromCamera();

            },
          ),
          CupertinoDialogAction(
            child: const Text('Gallery'),
            onPressed: () async {
              Navigator.pop(context);
              await selectFromGallery();

            },
          ),
          CupertinoDialogAction(
            child: const Text('Cancel'),
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
        title: const Text('Profile Image'),
        content: const Text("Please select an option to pick your image."),
        actions: [
          TextButton(
            child: const Text("Camera"),
            onPressed: () async {
              Navigator.pop(context);
              await _selectFromCamera();

            },
          ),
          TextButton(
            child: const Text("Gallery"),
            onPressed: () async {
              Navigator.pop(context);
              await selectFromGallery();

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
