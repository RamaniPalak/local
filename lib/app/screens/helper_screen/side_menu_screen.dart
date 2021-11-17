
import 'package:flutter/material.dart';
import 'package:local/app/components/common_components.dart';
import 'package:local/app/data/data_service/server_configs.dart';
import 'package:local/app/data/entity/res_entity/res_reservation.dart';
import 'package:local/app/providers/auth_provider.dart';
import 'package:local/app/screens/bank/history_screen.dart';
import 'package:local/app/screens/base/base_state_full.dart';
import 'package:local/app/screens/change_room/change_room.dart';
import 'package:local/app/screens/change_room/request_for_changeroom.dart';
import 'package:local/app/screens/complaints/raise_complaint.dart';
import 'package:local/app/screens/message/message_screen.dart';
import 'package:local/app/screens/notice/new_notice_screen.dart';
import 'package:local/app/screens/notice/notice_screen.dart';
import 'package:local/app/screens/profile/profile_screen.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/reservation.dart';
import 'package:local/app/utils/user_prefs.dart';
import 'package:local/app/views/common_images.dart';
import 'package:local/app/views/custom_popup_view.dart';
import 'package:provider/provider.dart';

class SideMenuScreen extends BasePage {
  SideMenuScreen({Key? key}) : super(key: key);

  @override
  _SideMenuScreenState createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends BaseState<SideMenuScreen> {
  List<String> screens = [
    'History ',
    'Raise Complaints',
    'Notice',
    'Message To FrontDesk',
    'Request for Change Room',
    'Review & Ratings',
    'Logout'
  ];

  // late LocalUser? user;
  //
  // bool isUserSet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reservationDetail();

    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
    //   final getUser = await UserPrefs.shared.getUser;
    //
    //   setState(() {
    //     user = getUser;
    //     isUserSet = true;
    //     //print(ServerConfigs.imageBaseURL + (user?.image ?? ''));
    //   });
    // });
  }

  reservationDetail() async {
    var res = await Reservation.shared.getUser;

    setState(() {
      reservationData = res;
    });
  }

  ResReservationData? reservationData;

  @override
  Widget build(BuildContext context) {
    // if (!isUserSet) {
    //   return Container();
    // }
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: kPrimaryColor,
            child: Padding(
              padding: EdgeInsets.only(
                  top: kFlexibleSize(30), bottom: kFlexibleSize(15)),
              child: SafeArea(
                bottom: false,
                child: profile(),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.only(
                top: kFlexibleSize(10), bottom: kFlexibleSize(10)),
            itemCount: screens.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (index == 0) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HistoryScreen()));
                  } else if (index == 1) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RaiseComplaint()));
                  } else if (index == 2) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>  const NoticeScreen(isCheckout: true)));
                  } else if (index == 3) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const MessageToFrontDeskScreen()));
                  } else if (index == 4) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NoticeScreen(isCheckout: false)));
                  } else if (index == 6) {
                    CustomPopup(context,
                        title: 'Logout',
                        message: 'Are you want to logout',
                        primaryBtnTxt: 'OK', primaryAction: () {
                      context.read<AuthProviderImpl>().logOutUser();
                    }, secondaryBtnTxt: 'CANCEL', secondaryAction: () {});
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: kFlexibleSize(21)),
                  height: kFlexibleSize(60.0),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                        width: 1, color: Colors.black.withOpacity(0.1)),
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          '${screens[index]}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: kLongTitleStyle,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: kFontColor,
                        size: kFlexibleSize(15.0),
                      )
                    ],
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }

  Widget defaultSizeBoxHeight({double? height}) {
    return SizedBox(
      height: kFlexibleSize(height ?? 10.0),
    );
  }

  Widget defaultSizeBoxWidth({double? width}) {
    return SizedBox(
      width: kFlexibleSize(width ?? 10.0),
    );
  }

  Widget profile() {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                     ProfileScreen()));
      },
      child: Container(
        height: kFlexibleSize(150),
        width: double.infinity,
        color: kPrimaryColor,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: kFlexibleSize(20)),
                  child: Container(
                      height: kFlexibleSize(70),
                      width: kFlexibleSize(70),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(kFlexibleSize(45)),
                        child:
                            Container(color: Colors.white, child: profileImage),
                      )),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: kFlexibleSize(10)),
                          child: Text(
                            '${reservationData?.memberName ?? ''}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: kMediumFontSize,
                                fontWeight: FontWeight.w900),
                          )),
                      Container(
                          padding: EdgeInsets.only(
                            left: kFlexibleSize(10),
                          ),
                          child: Text(
                            '${reservationData?.propertyName ?? ''}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: kLightStyle,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: kFlexibleSize(16),
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.only(
                        left: kFlexibleSize(20), right: kFlexibleSize(10)),
                    child: boxes(
                        hasPadding: true,
                        key: '₹${reservationData?.folioBalance ?? '-'}',
                        value: 'Payment Due')),
                Container(
                    height: 30,
                    padding: EdgeInsets.only(top: kFlexibleSize(5)),
                    child: VerticalDivider(color: kDivider)),
                Container(
                    padding: EdgeInsets.only(
                        left: kFlexibleSize(20), right: kFlexibleSize(10)),
                    child: boxes(
                        hasPadding: true,
                        key: '${reservationData?.roomNo ?? '-'}',
                        value: 'Room No.'))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget boxes(
      {required bool hasPadding, required String key, required String value}) {
    return Container(
      //color: Colors.white,
      // padding: EdgeInsets.only(
      //   left: kFlexibleSize(10),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$key',
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                fontSize: kBigFontSize,
                fontWeight: FontWeight.w900,
                color: Colors.white),
          ),
          Text('$value',
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: kLightStyle),
        ],
      ),
    );
  }
}
