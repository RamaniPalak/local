import 'package:flutter/material.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/common_images.dart';
import 'package:local/app/views/network_image.dart';

class ScheduleProfile extends StatelessWidget {

   ScheduleProfile({Key? key,this.houseModel}) : super(key: key);


  HouseModel? houseModel;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding:  EdgeInsets.all(kFlexibleSize(20)),
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular((kFlexibleSize(60))),
                          child: CustomNetWorkImage(
                            url:'${houseModel?.img}' ),
                        ),
                      ),
                    ),
                    Container(
                        padding:  EdgeInsets.only(top: kFlexibleSize(10)),
                        child: Text(
                          '${houseModel?.name ?? '-'}',
                          style: TextStyle(
                              fontSize: kBigFontSize,
                              fontWeight: FontWeight.w700,
                              color: kFontColor),
                        )),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding:  EdgeInsets.only(top: kFlexibleSize(10)),
                              child: Text(
                                'HKP Type :',
                                style: kAppBarTitle,
                              )),
                          Container(
                            padding:  EdgeInsets.only(top: kFlexibleSize(10), left: kFlexibleSize(5)),
                            child: Text(
                              '${houseModel?.hkpType ?? '-'}',
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
                      child: Divider(
                        height: kFlexibleSize(1),
                        thickness: kFlexibleSize(1),
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
                          padding: EdgeInsets.only(left : kFlexibleSize(10)),
                          child: Text('${houseModel?.time ?? '-'}', style: kTitleMediumStyle),
                        )
                      ],
                    ),
                    SizedBox(height: kFlexibleSize(20),),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left:kFlexibleSize(20)),
                            child: Container(
                                height: kFlexibleSize(15),
                                width: kFlexibleSize(15),
                                child: calendarBlackImage)),
                        Padding(
                          padding: EdgeInsets.only(left : kFlexibleSize(10)),
                          child: Text('${houseModel?.date ?? '-'}', style: kTitleMediumStyle),
                        )
                      ],
                    ),
                    SizedBox(height: kFlexibleSize(20),),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left:kFlexibleSize(20)),
                            child: Container(
                                height: kFlexibleSize(15),
                                width: kFlexibleSize(15),
                                child: callImage)),
                        Padding(
                          padding: EdgeInsets.only(left : kFlexibleSize(10)),
                          child: Text('${houseModel?.mobile ?? '-'}', style: kTitleMediumStyle),
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
                      padding: EdgeInsets.only(top: kFlexibleSize(8), left: kFlexibleSize(20), right: kFlexibleSize(20)),
                      child: Text(
                          '${houseModel?.note ?? '-'}',
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



class HouseModel {
  final String? img;
  final String? name;
  final String? time;
  final String? date;
  final String? note;
  final String? mobile;
  final String? hkpType;


  HouseModel(
      {
        this.img,
        this.name,
        this.time,
        this.date,
        this.note,
        this.mobile,
        this.hkpType
      });
}
