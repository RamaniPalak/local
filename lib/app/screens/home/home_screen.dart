import 'package:flutter/material.dart';
import 'package:local/app/components/card_components.dart';
import 'package:local/app/components/date_components.dart';
import 'package:local/app/components/home_profile_components.dart';
import 'package:local/app/screens/base/base_state_full.dart';
import 'package:local/app/screens/helper_screen/side_menu_screen.dart';
import 'package:local/app/screens/image_details/image_details_screen.dart';
import 'package:local/app/screens/message/message_screen.dart';
import 'package:local/app/screens/schedule/housekeeping_schedule.dart';
import 'package:local/app/screens/schedule/maintenance_schedule.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/base_button.dart';
import 'package:local/app/views/common_images.dart';

class HomeScreen extends BasePage {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> {
  bool? isCenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        title: Text(
          'LOCL colive & work',
          style: kAppBarTitleStyle,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: kFlexibleSize(20)),
            child: Container(
              width: kFlexibleSize(26),
              height: kFlexibleSize(26),
              child: notificationImage,
            ),
          )
        ],
      ),
      drawer: Container(width: kFlexibleSize(280), child: SideMenuScreen()),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Stack(
        children: [
          Container(
            height: kFlexibleSize(280),
            color: kPrimaryColor,
          ),
          Column(
            children: [
              SizedBox(
                height: kFlexibleSize(30),
              ),
              ProfileComponents(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: kFlexibleSize(30)),
                      child: Text(
                        'Events',
                        style: TextStyle(
                          fontSize: kRegularFontSize,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'View all',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: kTenFontSize,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: kFlexibleSize(5),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: kFlexibleSize(30)),
                        child: Container(
                          width: kFlexibleSize(10),
                          child: arrowRightImage,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: kFlexibleSize(10),
              ),
              Container(
                height: kFlexibleSize(120),
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ImageAndDetailsScreen()));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: kFlexibleSize(5),
                          right: kFlexibleSize(5),
                        ),
                        child: CardComponents(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: kFlexibleSize(25),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext) => HouseKeepingScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: kFlexibleSize(20)),
                        child: Text(
                          'Housekeeping Schedule',
                          style: TextStyle(
                            fontSize: kRegularFontSize,
                            fontWeight: FontWeight.w700,
                            color: kFontColor,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'View all',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: kFontColor,
                              fontSize: kTenFontSize,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: kFlexibleSize(5),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: kFlexibleSize(20)),
                          child: Container(
                            width: kFlexibleSize(10),
                            child: arrowRightBlackImage,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: kFlexibleSize(16),
              ),
              Container(
                height: kFlexibleSize(70),
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: kFlexibleSize(10), right: kFlexibleSize(10)),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 7,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: kFlexibleSize(5), right: kFlexibleSize(5)),
                          child: DateComponent(
                            title: 'M',
                            date: '7',
                            color: kBgColor,
                            titleColor: kPrimaryColor,
                          ),
                        );
                      }),
                ),
              ),
              SizedBox(
                height: kFlexibleSize(25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: kFlexibleSize(20)),
                      child: Text(
                        'Maintenance Schedule',
                        style: TextStyle(
                          fontSize: kRegularFontSize,
                          fontWeight: FontWeight.w700,
                          color: kFontColor,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext) => MaintenanceScreen()));
                    },
                    child: Row(
                      children: [
                        Text(
                          'View all',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: kFontColor,
                              fontSize: kTenFontSize,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: kFlexibleSize(5),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: kFlexibleSize(20)),
                          child: Container(
                            width: kFlexibleSize(10),
                            child: arrowRightBlackImage,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: kFlexibleSize(16),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: kFlexibleSize(20), right: kFlexibleSize(20)),
                child: Row(
                  children: [
                    DateComponent(
                      title: 'M',
                      date: '7',
                      color: kBgColor,
                      titleColor: kPrimaryColor,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: kFlexibleSize(10)),
                      child: DateComponent(
                        title: 'T',
                        date: '7',
                        color: kBgColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: kFlexibleSize(9)),
                      child: DateComponent(
                        title: 'W',
                        date: '8',
                        color: kBgRedColor,
                        titleColor: kRedColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: kFlexibleSize(9)),
                      child: DateComponent(
                        title: 'T',
                        date: '9',
                        color: kBgColor,
                        titleColor: kPrimaryColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: kFlexibleSize(9)),
                      child: DateComponent(
                        title: 'F',
                        date: '10',
                        color: kBgRedColor,
                        titleColor: kRedColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: kFlexibleSize(9)),
                      child: DateComponent(
                        title: 'S',
                        date: '11',
                        color: kBgColor,
                        titleColor: kPrimaryColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: kFlexibleSize(9)),
                      child: DateComponent(
                        title: 'S',
                        date: '12',
                        color: kBgColor,
                        titleColor: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: kFlexibleSize(33),
              ),
              Padding(
                padding: EdgeInsets.all(kFlexibleSize(8)),
                child: BaseAppBtn(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext) =>
                                MessageToFrontDeskScreen()));
                  },
                  title: 'Message To FrontDesk',
                ),
              ),
              SizedBox(
                height: kFlexibleSize(33),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
