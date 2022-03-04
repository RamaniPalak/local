import 'dart:ui';
import 'package:flutter/material.dart';

Color kPrimaryColor = const Color(0xff21245a);
Color kWhiteColor = const Color(0xfff3f4fa);
Color kBlackColor = const Color(0xff000000);
Color kDivider = const Color(0xffcad1d8);
Color kRedColor = const Color(0xffE94040);
Color kGreyColor = const Color(0xff576d7e);
Color kLightColor = const Color(0xffe2e5e7);
Color kBgColor = const Color(0x2621245a);
Color kBgRedColor = const Color(0x26e94040);
Color dividerColor = const Color(0x2621245a);
Color yellowColor = const Color(0xfff7b84e);
Color backgroundColor = const Color(0xE5E5E5);
Color greenColor = const Color(0xff58A01E);
Color greyColor = const Color(0xffB0B7BD);
Color kborderColor = const Color(0x40000000);


String kInitialRoute = '/';
String kLoginRoute = '/LoginScreen';
String kHomeRoute = '/HomeScreen';

//FontFamily
String kRegularFonts = "Lato";

double kFontRatio = 1.0;
final double kDoubleSize = 30 * kFontRatio;
final double kDoubleFontSize = 24 * kFontRatio;
final double kBigFontSize = 18 * kFontRatio;
final double kMediumFontSize = 16 * kFontRatio;
final double kRegularFontSize = 14 * kFontRatio;
final double kSmallFontSize = 12 * kFontRatio;
final double kTenFontSize = 10 * kFontRatio;
final double kExtraSmallFontSize = 8 * kFontRatio;

double kFlexibleSize(double size) {
  return size * kFontRatio;
}

final kAuthTitleStyle = TextStyle(
  color: kBlackColor,
  fontFamily: kRegularFonts,
  fontSize: kRegularFontSize,
  fontWeight: FontWeight.w400,
);

final kLightTitle = TextStyle(
  color: kGreyColor,
  fontFamily: kRegularFonts,
  fontSize: kRegularFontSize,
  fontWeight: FontWeight.w400,
);

final kAppBarTitleStyle = TextStyle(
  color: kWhiteColor,
  fontFamily: kRegularFonts,
  fontSize: kMediumFontSize,
  fontWeight: FontWeight.w600,
);

final kTitleMediumStyle = TextStyle(
  color: kBlackColor,
  fontFamily: kRegularFonts,
  fontSize: kMediumFontSize,
  fontWeight: FontWeight.w600,
);

final kLongTitleStyle = TextStyle(
  color: kBlackColor,
  fontFamily: kRegularFonts,
  fontSize: kRegularFontSize,
  fontWeight: FontWeight.w400,
);

final kCommonBlueShadow = [
  BoxShadow(
    color: kPrimaryColor.withOpacity(0.5),
    spreadRadius: 0,
    blurRadius: 20,
    offset: Offset(0, 10), // changes position of shadow
  ),
];

final kCommonShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.1),
    spreadRadius: 0,
    blurRadius: 20,
    offset: Offset(0, 10), // changes position of shadow
  ),
];

final kAppBarTitle = TextStyle(
    color: Colors.black,
    fontSize: kMediumFontSize,
    fontFamily: kRegularFonts,
    fontWeight: FontWeight.w700);

final kProfileTitle = TextStyle(
  color: Colors.white,
  fontSize: kBigFontSize,
  fontWeight: FontWeight.w900,
  fontFamily: kRegularFonts,
);

final kRegularProfileText = TextStyle(
    color: Colors.white,
    fontSize: kRegularFontSize,
    fontFamily: kRegularFonts,
    fontWeight: FontWeight.w400);

final kRegularText = TextStyle(
  color: kBlackColor,
  fontSize: kRegularFontSize,
  fontWeight: FontWeight.w600,
  fontFamily: kRegularFonts,
);

final kLightStyle = TextStyle(
    fontFamily: kRegularFonts,
    color: kLightColor,
    fontSize: kMediumFontSize,
    fontWeight: FontWeight.w400);

final kTransactionStyle = TextStyle(
    fontFamily: kRegularFonts,
    color: const Color(0xff576d7e),
    fontSize: kSmallFontSize,
    fontWeight: FontWeight.w400);

Container bgContainer({required Widget widget}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: kFlexibleSize(10.0)),
    padding: EdgeInsets.all(kFlexibleSize(15.0)),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0)),
    child: widget,
  );
}
