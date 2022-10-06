import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local/app/screens/auth/login_screen.dart';
import 'package:local/app/screens/lending_page.dart';
import 'package:local/app/screens/message/message_screen.dart';
import 'app/utils/constants.dart';

Widget app() {
  String? selectedNotificationPayload;

  return MaterialApp(
    title: 'Locl',
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    theme: ThemeData(
         fontFamily: kRegularFonts,
        appBarTheme: AppBarTheme(
            backgroundColor: kWhiteColor,
            elevation: 0,
            foregroundColor: Colors.black,
            centerTitle: true,
            titleTextStyle:  TextStyle(
                 fontFamily: kRegularFonts,
                fontSize: kMediumFontSize,
                fontWeight: FontWeight.w600,
                color: Colors.black),
            systemOverlayStyle: Platform.isAndroid
                ? SystemUiOverlayStyle(
                    statusBarColor: kPrimaryColor,
                    statusBarBrightness: Brightness.light,
                    statusBarIconBrightness: Brightness.light,
                    systemNavigationBarIconBrightness: Brightness.light,
                  )
                : SystemUiOverlayStyle.light),
        scaffoldBackgroundColor: kWhiteColor,
        primaryColor: kPrimaryColor,
        primarySwatch: Colors.indigo),
    initialRoute: kInitialRoute,
    routes:  {
      kInitialRoute: (context) => LendingPage(),
      kLoginRoute: (context) => const LoginScreen(),
      MessageToFrontDeskScreen.routeName: (_) => MessageToFrontDeskScreen()
    },
  );
}
