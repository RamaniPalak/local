import 'package:flutter/material.dart';
import 'package:local/app/components/date_components.dart';
import 'package:local/app/components/schedule_housekeeping_profile.dart';
import 'package:local/app/data/entity/res_entity/res_housekeeping.dart';
import 'package:local/app/providers/housekeeping_provider.dart';
import 'package:local/app/screens/base/base_state_full.dart';
import 'package:local/app/screens/home/home_screen.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';
import 'package:local/app/views/base_button.dart';
import 'package:local/app/views/loading_small.dart';
import 'package:provider/provider.dart';

class HouseKeepingScreen extends BasePage {
  HouseKeepingScreen({Key? key}) : super(key: key);

  @override
  _HouseKeepingScreenState createState() => _HouseKeepingScreenState();
}

class _HouseKeepingScreenState extends BaseState<HouseKeepingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<HouseKeepingProviderImpl>().houseKeepingDate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
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
          // Container(
          //   padding: EdgeInsets.only(
          //       left: kFlexibleSize(20), right: kFlexibleSize(20)),
          //   child: Row(
          //     children: [
          //       DateComponent(
          //         title: 'M',
          //         date: '7',
          //         color: kBgColor,
          //         titleColor: kPrimaryColor,
          //       ),
          //       Padding(
          //         padding: EdgeInsets.only(left: kFlexibleSize(10)),
          //         child: DateComponent(
          //           title: 'T',
          //           date: '7',
          //           color: kBgColor,
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.only(left: kFlexibleSize(9)),
          //         child: DateComponent(
          //           title: 'W',
          //           date: '8',
          //           color: kBgRedColor,
          //           titleColor: kRedColor,
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.only(left: kFlexibleSize(9)),
          //         child: DateComponent(
          //           title: 'T',
          //           date: '9',
          //           color: kBgColor,
          //           titleColor: kPrimaryColor,
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.only(left: kFlexibleSize(9)),
          //         child: DateComponent(
          //           title: 'F',
          //           date: '10',
          //           color: kBgRedColor,
          //           titleColor: kRedColor,
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.only(left: kFlexibleSize(9)),
          //         child: DateComponent(
          //           title: 'S',
          //           date: '11',
          //           color: kBgColor,
          //           titleColor: kPrimaryColor,
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.only(left: kFlexibleSize(9)),
          //         child: DateComponent(
          //           title: 'S',
          //           date: '12',
          //           color: kBgColor,
          //           titleColor: kPrimaryColor,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          houseKeeping(),
          SizedBox(
            height: kFlexibleSize(20),
          )
        ]),
      ),
    ));
  }

  Widget houseKeeping() {
    final housekeeping = context.watch<HouseKeepingProviderImpl>();

    final hasError = housekeeping.housekeepingRes?.state == Status.ERROR ||
        housekeeping.housekeepingRes?.state == Status.UNAUTHORISED;

    if (housekeeping.housekeepingRes?.state == Status.LOADING) {
      return Center(child: LoadingSmall());
    }

    final data =
        housekeeping.housekeepingRes?.data?.data?.masterHouseKeepingScheduleRes;

    final housekeepingData = data?[housekeeping.selectedIndex];

    return hasError
        ? NoEventFound(
            title: 'No HouseKeeping data ',
            retryCall: () {
              context.read<HouseKeepingProviderImpl>().houseKeepingDate();
            })
        : Container(
            child: Column(
              children: [
                Container(
                  height: kFlexibleSize(70),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: kFlexibleSize(20), right: kFlexibleSize(20)),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              context
                                  .read<HouseKeepingProviderImpl>()
                                  .setIndex(index: index);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: kFlexibleSize(4),
                                  right: kFlexibleSize(4)),
                              child: DateComponent(
                                isSelected: index == housekeeping.selectedIndex,
                                title: data?[index].hkp?.startDate,
                                date: data?[index].hkp?.startDay,
                                colors: data?[index].hkp?.hkpColor,
                                titleColor: data?[index].hkp?.hkpColorText,
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: kFlexibleSize(40),
                ),
                ScheduleProfile(
                  houseModel: HouseModel(
                    img: housekeepingData?.hkp?.profilePic,
                      date: housekeepingData?.hkp?.hkpDateFormat,
                      time: housekeepingData?.hkp?.startTime,
                      name: housekeepingData?.hkp?.housekeeperName,
                      hkpType: housekeepingData?.hkp?.cleanTypeTerm,
                      note: housekeepingData?.hkp?.reservationdetails,
                      mobile: housekeepingData?.hkp?.mobileNo),
                ),
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
                          onTap: () {
                            context.read<HouseKeepingProviderImpl>().cancelHKP(
                                hkpReserId: housekeepingData?.hkp?.hkpReservationId ?? '');

                            context.read<HouseKeepingProviderImpl>().cancelHKPRes;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: kFlexibleSize(6)),
                        width: kFlexibleSize(100),
                        height: kFlexibleSize(45),
                        child: Button(
                          title: 'DND',
                          color: kRedColor,
                          textcolor: kBGColor,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: kFlexibleSize(6)),
                        width: kFlexibleSize(110),
                        height: kFlexibleSize(45),
                        child: BaseAppButton(
                          title: 'New Request',
                          color: kPrimaryColor,
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
