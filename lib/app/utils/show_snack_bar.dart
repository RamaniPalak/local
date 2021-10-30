import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowSnackBar {
  ShowSnackBar({required BuildContext context, required String message}) {
    final snackBar = SnackBar(
      backgroundColor: Colors.black.withOpacity(0.7),
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 1.0,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
