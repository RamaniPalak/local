import 'package:flutter/material.dart';
import 'package:local/app/providers/auth_provider.dart';
import 'package:local/app/screens/auth/enter_otp_screen.dart';
import 'package:local/app/screens/auth/login_screen.dart';
import 'package:local/app/screens/auth/reservation_screen.dart';
import 'package:local/app/screens/bank/bank_detail_screen.dart';
import 'package:local/app/screens/bank/history_screen.dart';
import 'package:local/app/screens/bank/monthly_invoice.dart';
import 'package:local/app/screens/bank/transaction/transaction_history_screen.dart';
import 'package:local/app/screens/base/base_state_less.dart';
import 'package:local/app/screens/change_room/change_room.dart';
import 'package:local/app/screens/change_room/request_for_changeroom.dart';
import 'package:local/app/screens/complaints/new_complaint_screen.dart';
import 'package:local/app/screens/complaints/raise_complaint.dart';
import 'package:local/app/screens/helper_screen/stuck_page.dart';
import 'package:local/app/screens/home/home_screen.dart';
import 'package:local/app/screens/image_details/image_details_screen.dart';
import 'package:local/app/screens/message/message_screen.dart';
import 'package:local/app/screens/notice/new_notice_screen.dart';
import 'package:local/app/screens/notice/notice_screen.dart';
import 'package:local/app/screens/profile/profile_screen.dart';
import 'package:local/app/screens/profile/update_profile_screen.dart';
import 'package:local/app/screens/schedule/housekeeping_schedule.dart';
import 'package:local/app/screens/schedule/maintenance_schedule.dart';
import 'package:local/app/screens/splash_screen.dart';
import 'package:local/app/utils/constants.dart';
import 'package:provider/provider.dart';

import 'documents/document_screen.dart';

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
    if (auth.isLogin ?? false) {
      if(auth.isReservationSelected == true){
        return HomeScreen();
      }
      return ReservationScreen();
    }
    else {
      return LoginScreen();
    }
  }
}
