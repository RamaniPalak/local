import 'package:flutter/material.dart';
import 'package:local/app/components/date_components.dart';
import 'package:local/app/components/schedule_maintenance_profile.dart';
import 'package:local/app/screens/base/base_state_full.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/base_button.dart';

class MaintenanceScreen extends BasePage {
  MaintenanceScreen({Key? key}) : super(key: key);

  @override
  _MaintenanceScreenState createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends BaseState<MaintenanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Maintenance Schedule',
        ),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
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
                    date: '6',
                    colors: kBgColor,
                    titleColor: kPrimaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: kFlexibleSize(10)),
                    child: DateComponent(
                      title: 'T',
                      date: '7',
                      colors: kBgColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: kFlexibleSize(9)),
                    child: DateComponent(
                      title: 'W',
                      date: '8',
                      colors: kBgRedColor,
                      titleColor: kRedColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: kFlexibleSize(9)),
                    child: DateComponent(
                      title: 'T',
                      date: '9',
                      colors: kBgColor,
                      titleColor: kPrimaryColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: kFlexibleSize(9)),
                    child: DateComponent(
                      title: 'F',
                      date: '10',
                      colors: kBgRedColor,
                      titleColor: kRedColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: kFlexibleSize(9)),
                    child: DateComponent(
                      title: 'S',
                      date: '11',
                      colors: kBgColor,
                      titleColor: kPrimaryColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: kFlexibleSize(9)),
                    child: DateComponent(
                      title: 'S',
                      date: '12',
                      colors: kBgColor,
                      titleColor: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: kFlexibleSize(40),
            ),
            const ScheduleMaintenanceProfile(),
            SizedBox(
              height: kFlexibleSize(50),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: kFlexibleSize(30), right: kFlexibleSize(30)),
              child: BaseAppButton(
                color: kPrimaryColor,
                title: 'New Maintenance Request',
              ),
            ),
            SizedBox(
              height: kFlexibleSize(20),
            ),
          ],
        ),
      ),
    ));
  }
}
