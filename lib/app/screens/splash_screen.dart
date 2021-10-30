import 'package:flutter/material.dart';
import 'package:local/app/screens/base/base_state_less.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/common_images.dart';

class SplashScreen extends BaseStateLess {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: kFlexibleSize(50)),
              height: kFlexibleSize(556),
              width: double.infinity,
              child: appIconImage,
            ),
            Container(width: double.infinity, child: appBottomImage),
          ],
        ),
      ),
    );
  }
}
