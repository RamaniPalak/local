import 'package:flutter/material.dart';
import 'package:local/app/providers/auth_provider.dart';
import 'package:local/app/screens/auth/login_screen.dart';
import 'package:local/app/screens/auth/reservation_screen.dart';
import 'package:local/app/screens/base/base_state_less.dart';
import 'package:local/app/screens/firebase_notify.dart';
import 'package:local/app/screens/helper_screen/stuck_page.dart';
import 'package:local/app/screens/home/home_screen.dart';
import 'package:local/app/screens/splash_screen.dart';
import 'package:local/app/screens/timer/timer_screen.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/firebase.dart';
import 'package:provider/provider.dart';

class LendingPage extends BaseStateLess {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    kFontRatio =
        size.width / 375; //375 will de designer's width for iphone 12 size

    print('$kFontRatio ${size.width} ${size.height}');

    final auth = context.watch<AuthProviderImpl>();

    // return Consumer<AuthProviderImpl>(builder: (context, auth, __) {


    if (auth.isAppUnderMaintenance == true) {
      return StuckTheAppPage(
          btnTap: () {},
          text: 'App is under maintenance. Please try again latter.',
          btnText: 'Try again!');
    }

    if (auth.isNewUpdateAvailable == true) {
      return StuckTheAppPage(
          btnTap: () {},
          text: 'New update available, please click on go to update the app.',
          btnText: 'Update');
    }

    if (auth.isLogin == null) {
      return SplashScreen();
    }
    if (auth.isLogin ?? false ) {
      if(auth.isReservationSelected == true  ){
        return FirebaseHandler(child: HomeScreen ());
      }
      return ReservationScreen();
    }
    else {
      return const LoginScreen();
    }
  }
}
