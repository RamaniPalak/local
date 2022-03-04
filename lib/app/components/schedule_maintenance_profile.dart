import 'package:flutter/material.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/common_images.dart';

class ScheduleMaintenanceProfile extends StatelessWidget {
  const ScheduleMaintenanceProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double bottom;
    //assert(bottom != null);

    return Container(
      // width: screenSize.width / 1,
      // height: screenSize.height / 1.8,
      padding: EdgeInsets.all(kFlexibleSize(20)),
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                top: 60,
                bottom: 0,
                left: 0,
                right: 0,
                child: Card(
                  elevation: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(kFlexibleSize(5))),
                  ),
                ),
              ),
              SizedBox(
                height: kFlexibleSize(400),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: kFlexibleSize(120),
                        width: kFlexibleSize(120),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular((kFlexibleSize(50))),
                              child: maleProfileImage,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: kFlexibleSize(10)),
                        child: Text(
                          'Jenny Wilson',
                          style: TextStyle(
                              fontSize: kBigFontSize,
                              fontWeight: FontWeight.w700,
                              color: kBlackColor),
                        )),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding: EdgeInsets.only(top: kFlexibleSize(10)),
                              child: Text(
                                'HKP Type:',
                                style: kAppBarTitle,
                              )),
                          Container(
                            padding: EdgeInsets.only(
                                top: kFlexibleSize(10),
                                left: kFlexibleSize(13)),
                            child: Text(
                              'Full',
                              style: TextStyle(
                                  fontSize: kMediumFontSize,
                                  fontWeight: FontWeight.w700,
                                  color: kRedColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(kFlexibleSize(8)),
                      child: const Divider(
                        height: 1,
                        thickness: 1,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: kFlexibleSize(20)),
                            child: Container(
                                height: kFlexibleSize(15),
                                width: kFlexibleSize(15),
                                child: clockBlackImage)),
                        Padding(
                          padding: EdgeInsets.only(left: kFlexibleSize(10)),
                          child: Text('07:00 am - 09:00 am',
                              style: kTitleMediumStyle),
                        )
                      ],
                    ),
                    SizedBox(height: kFlexibleSize(20)),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: kFlexibleSize(20)),
                            child: Container(
                                height: kFlexibleSize(15),
                                width: kFlexibleSize(15),
                                child: calendarBlackImage)),
                        Padding(
                          padding: EdgeInsets.only(left: kFlexibleSize(10)),
                          child: Text('Jan 04 2021', style: kTitleMediumStyle),
                        )
                      ],
                    ),
                    SizedBox(height: kFlexibleSize(20)),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: kFlexibleSize(20)),
                            child: Container(
                                height: kFlexibleSize(15),
                                width: kFlexibleSize(15),
                                child: callImage)),
                        Padding(
                          padding: EdgeInsets.only(left: kFlexibleSize(10)),
                          child: Text(' +8365699852', style: kTitleMediumStyle),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(kFlexibleSize(8)),
                      child: const Divider(
                        thickness: 1,
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: kFlexibleSize(8),
                          left: kFlexibleSize(20),
                          right: kFlexibleSize(20)),
                      child: Text(
                          'Lorem Ipsum is simply dummy text of the and typesetting industry. Lorem Ipsum has been industry.',
                          style: kLongTitleStyle,
                          softWrap: true),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
