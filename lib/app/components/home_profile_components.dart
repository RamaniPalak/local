import 'package:flutter/material.dart';
import 'package:local/app/data/entity/res_entity/res_reservation.dart';
import 'package:local/app/screens/profile/profile_screen.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/reservation.dart';
import 'package:local/app/views/common_images.dart';

class ProfileComponents extends StatefulWidget {
  ProfileComponents({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileComponents> createState() => _ProfileComponentsState();
}

class _ProfileComponentsState extends State<ProfileComponents> {

 @override
  void initState() {
   super.initState();
   reservationDetail();

  }

  reservationDetail() async {

    var res = await Reservation.shared.getUser;

    setState(()  {
      reservationData = res;
    });
  }

 ResReservationData? reservationData;

  @override
  Widget build(BuildContext context) {



   return Container(
      height: kFlexibleSize(150),
      width: double.infinity,
      color: kPrimaryColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext) => ProfileScreen()));
            },
            child: Padding(
              padding: EdgeInsets.only(left: kFlexibleSize(20)),
              child: Container(
                  height: kFlexibleSize(85),
                  width: kFlexibleSize(90),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(kFlexibleSize(45)),
                    child: Container(color: Colors.white, child: profileImage),
                  )),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(left: kFlexibleSize(14)),
                    child: Text(
                      '${reservationData?.memberName ?? ''}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kProfileTitle,
                    )),
                Container(
                    padding: EdgeInsets.only(
                      left: kFlexibleSize(14),
                    ),
                    child: Text(
                      '${reservationData?.propertyName ?? ''}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: kRegularProfileText,
                    )),
                SizedBox(
                  height: kFlexibleSize(10),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.only(
                            left: kFlexibleSize(14),
                          ),
                          child: boxes(
                              hasPadding: true,
                              key: '₹ ${reservationData?.folioBalance ?? '-'}',
                              value: 'Payment Due')),
                    ),
                    Container(
                        height: 30,
                        padding: EdgeInsets.only(top: kFlexibleSize(5)),
                        child: VerticalDivider(color: kDivider)),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.only(
                            left: kFlexibleSize(14),
                          ),
                          child: boxes(
                              hasPadding: true, key: '${reservationData?.roomNo ?? '-'}', value: 'Room No.')),
                    )
                  ],
                ),
                SizedBox(
                  height: kFlexibleSize(5),
                ),
                Padding(
                  padding: EdgeInsets.only(left: kFlexibleSize(14)),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: kFlexibleSize(2), horizontal: kFlexibleSize(6)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(kFlexibleSize(3))),
                    child: Text(
                      'Pay Now',
                      style: TextStyle(
                          fontSize: kSmallFontSize,
                          color: kRedColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget boxes(
    {required bool hasPadding, required String key, required String value}) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$key',
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style:
          TextStyle(
              fontSize: kDoubleFontSize,
              fontWeight: FontWeight.w900,
              color: Colors.white),
        ),
        Text(
          '$value',
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: kLightStyle
        ),
      ],
    ),
  );
}
