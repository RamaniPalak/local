import 'package:flutter/material.dart';
import 'package:local/app/screens/base/base_state_less.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/common_images.dart';

class SplashScreen extends BaseStateLess {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: backgroundColor,
          child: Stack(
            children: [
              Container(width: double.infinity, child: appBottomImage,alignment: Alignment.bottomCenter),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: kFlexibleSize(60)),
                    height: kFlexibleSize(450),
                    width: double.infinity,
                    child: loclImage,
                  ),
                  Container(

                      width: double.infinity,
                      child: loclTextImage),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
