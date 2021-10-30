import 'package:flutter/material.dart';
import 'package:local/app/components/date_components.dart';
import 'package:local/app/components/schedule_housekeeping_profile.dart';
import 'package:local/app/screens/base/base_state_full.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/base_button.dart';

class HouseKeepingScreen extends BasePage {
  HouseKeepingScreen({Key? key}) : super(key: key);

  @override
  _HouseKeepingScreenState createState() => _HouseKeepingScreenState();
}

class _HouseKeepingScreenState extends BaseState<HouseKeepingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Housekeeping Schedule',
        ),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        child: Column(children: [
          SizedBox(
            height: kFlexibleSize(20),
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
            height: kFlexibleSize(40),
          ),
          ScheduleProfile(),
          SizedBox(
            height: kFlexibleSize(50),
          ),
          Container(
            padding: EdgeInsets.only(
                left: kFlexibleSize(20), right: kFlexibleSize(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: kFlexibleSize(110),
                    height: kFlexibleSize(45),
                    child: Button(
                      title: 'Cancel HKP',
                      color: kBgColor,
                      textcolor: kPrimaryColor,
                    )),
                Container(
                    padding: EdgeInsets.only(left: kFlexibleSize(6)),
                    width: kFlexibleSize(100),
                    height: kFlexibleSize(45),
                    child: Button(
                      title: 'DND',
                      color: kRedColor,
                      textcolor: kBGColor,
                    )),
                Container(
                    padding: EdgeInsets.only(left: kFlexibleSize(6)),
                    width: kFlexibleSize(110),
                    height: kFlexibleSize(45),
                    child: BaseAppButton(
                      title: 'New Request',
                      color: kPrimaryColor,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: kFlexibleSize(20),
          )
        ]),
      ),
    ));
  }
}

class Button extends StatelessWidget {
  Button({Key? key, this.title, this.color, this.textcolor}) : super(key: key);

  final String? title;
  final Color? color;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //onTap: onTap,
      child: Container(
        height: kFlexibleSize(45.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: double.infinity,
          child: Center(
              child: Text(
            title!,
            style: TextStyle(
                fontSize: kRegularFontSize,
                fontWeight: FontWeight.w700,
                color: textcolor),
          )),
        ),
      ),
    );
  }
}
