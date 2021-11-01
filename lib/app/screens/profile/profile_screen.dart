import 'package:flutter/material.dart';
import 'package:local/app/components/common_components.dart';
import 'package:local/app/data/entity/res_entity/res_reservation.dart';
import 'package:local/app/providers/auth_provider.dart';
import 'package:local/app/screens/bank/bank_detail_screen.dart';
import 'package:local/app/screens/bank/transaction/transaction_history_screen.dart';
import 'package:local/app/screens/documents/document_screen.dart';
import 'package:local/app/screens/profile/update_profile_screen.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/reservation.dart';
import 'package:local/app/utils/user_prefs.dart';
import 'package:local/app/views/base_button.dart';
import 'package:local/app/views/common_images.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    reservationDetail();
  }

  reservationDetail() async {
    var res = await Reservation.shared.getUser;
    var user = await UserPrefs.shared.getUser;

    setState(() {
      reservationData = res;
      localUser = user;
    });
  }

  ResReservationData? reservationData;
  LocalUser? localUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F3F7),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Profile',
          style: kAppBarTitleStyle,
        ),
        elevation: 0.0,
        backgroundColor: kPrimaryColor,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext) => UpdateProfileScreen())).then((value) {
                        if(value == true){
                          reservationDetail();
                        }
              });
            },
            child: Padding(
              padding: EdgeInsets.only(
                right: kFlexibleSize(20),
              ),
              child: Container(
                height: kFlexibleSize(20),
                width: kFlexibleSize(20),
                child: editIconImage,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              height: kFlexibleSize(285),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(kFlexibleSize(20)),
                      bottomRight: Radius.circular(kFlexibleSize(20)))),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    height: kFlexibleSize(30 + 120 + 63),
                    child: Column(
                      children: [
                        SizedBox(height: kFlexibleSize(30)),
                        SizedBox(
                          height: kFlexibleSize(120),
                          child: Center(
                            child: Container(
                              width: kFlexibleSize(120),
                              height: kFlexibleSize(120),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(kFlexibleSize(60))),
                              child: profileImage,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: kFlexibleSize(63),
                          child: Center(
                            child: Text(
                              '${reservationData?.memberName ?? ''}',
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: kProfileTitle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: kFlexibleSize(20)),
                    padding: EdgeInsets.symmetric(vertical: kFlexibleSize(15)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kFlexibleSize(20)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Stay In',
                          style: TextStyle(
                              fontSize: kMediumFontSize,
                              fontWeight: FontWeight.w400,
                              color: kGreyColor),
                        ),
                        SizedBox(height: kFlexibleSize(4)),
                        Text(
                          '${reservationData?.propertyName ?? ''}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: kAppBarTitle,
                        ),
                        SizedBox(height: kFlexibleSize(15)),
                        Container(
                          height: kFlexibleSize(1),
                          width: double.infinity,
                          color: kGreyColor.withOpacity(0.15),
                        ),
                        SizedBox(
                          height: kFlexibleSize(71),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.all(kFlexibleSize(5)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '₹${reservationData?.folioBalance ?? ''}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: kDoubleFontSize,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Payment Due',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: kGreyColor,
                                        fontFamily: kRegularFonts,
                                        fontSize: kMediumFontSize,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                              Container(
                                width: kFlexibleSize(1),
                                height: double.infinity,
                                color: kGreyColor.withOpacity(0.15),
                              ),
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.all(kFlexibleSize(5)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${reservationData?.roomNo ?? ''}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: kDoubleFontSize,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Room No.',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: kGreyColor,
                                        fontFamily: kRegularFonts,
                                        fontSize: kMediumFontSize,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: kFlexibleSize(30)),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: kFlexibleSize(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Personal Info.',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: kBigFontSize,
                                fontWeight: FontWeight.w700)),
                        SizedBox(height: kFlexibleSize(20)),
                        leadingIconWidget(
                            leading: callImage,
                            text: '+91${localUser?.mobile ?? ''}'),
                        SizedBox(height: kFlexibleSize(10)),
                        leadingIconWidget(
                            leading: messageImage,
                            text: '${localUser?.email ?? ''}'),
                      ],
                    ),
                  ),
                  SizedBox(height: kFlexibleSize(47)),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: kFlexibleSize(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        BaseAppBtn(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        DocumentScreen()));
                          },
                          title: 'Documents',
                        ),
                        SizedBox(height: kFlexibleSize(10)),
                        BaseAppBtn(
                          title: 'Bank Details',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        BankDetailScreen()));
                          },
                        ),
                        SizedBox(height: kFlexibleSize(10)),
                        BaseAppBtn(
                          title: 'Transaction History',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TransactionHistoryScreen()));
                          },
                        ),
                        SizedBox(height: kFlexibleSize(10)),
                        BaseAppBtn(
                          onTap: () {
                            Provider.of<AuthProviderImpl>(context,
                                    listen: false)
                                .selectReservation();
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                          },
                          title: 'Reservation',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kFlexibleSize(20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
