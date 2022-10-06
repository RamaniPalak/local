import 'package:flutter/material.dart';
import 'package:local/app/components/date_components.dart';
import 'package:local/app/components/schedule_housekeeping_profile.dart';
import 'package:local/app/providers/housekeeping_provider.dart';
import 'package:local/app/screens/base/base_state_full.dart';
import 'package:local/app/screens/home/home_screen.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';
import 'package:local/app/views/base_button.dart';
import 'package:local/app/views/custom_popup_view.dart';
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
        ? Center(
            child: NoEventFound(
                title: 'No HouseKeeping data ',
                retryCall: () {
                  context.read<HouseKeepingProviderImpl>().houseKeepingDate();
                }),
          )
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
                      housekeepingData?.hkp?.employeeId == null
                          ? SizedBox(
                              width: kFlexibleSize(150),
                              height: kFlexibleSize(45),
                              child: Button(
                                title: 'Cancelled',
                                color: kBgColor,
                                textcolor: kPrimaryColor,
                              ),
                            )
                          : SizedBox(
                              width: kFlexibleSize(150),
                              height: kFlexibleSize(45),
                              child: Button(
                                title: 'Cancel HKP',
                                color: kBgColor,
                                textcolor: kPrimaryColor,
                                onTap: () {
                                  CustomPopup(context,
                                      title: 'Cancel HKP',
                                      message: 'Are you sure you want to Cancel HKP ?',
                                      primaryBtnTxt: 'Ok', primaryAction: () {
                                        context
                                            .read<HouseKeepingProviderImpl>()
                                            .cancelHKP(
                                            hkpReserId: housekeepingData
                                                ?.hkp?.hkpReservationId ??
                                                '');

                                        context
                                            .read<HouseKeepingProviderImpl>()
                                            .cancelHKPRes;
                                      },
                                      secondaryBtnTxt: 'CANCEL',
                                      secondaryAction: () {});

                                },
                              ),
                            ),

                      housekeepingData?.hkp?.hkpStatusTerm == 'CheckIn'
                          ? Container(
                              padding: EdgeInsets.only(left: kFlexibleSize(6)),
                              width: kFlexibleSize(150),
                              height: kFlexibleSize(45),
                              child: Button(
                                title: 'DND',
                                color: kRedColor,
                                textcolor: kWhiteColor,
                                onTap: () {
                                  CustomPopup(context,
                                      title: 'DND',
                                      message: 'Are you sure you want to DND ?',
                                      primaryBtnTxt: 'Ok', primaryAction: () {
                                    context
                                        .read<HouseKeepingProviderImpl>()
                                        .hkpStates(
                                            hkpReserId: housekeepingData
                                                    ?.hkp?.hkpReservationId ??
                                                '',
                                            updateLog: housekeepingData
                                                ?.hkp?.updateLog,
                                            term: 'MarkAsDND');

                                    context
                                        .read<HouseKeepingProviderImpl>()
                                        .hkpStatesRes;
                                  },
                                      secondaryBtnTxt: 'CANCEL',
                                      secondaryAction: () {});
                                },
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.only(left: kFlexibleSize(6)),
                              width: kFlexibleSize(150),
                              height: kFlexibleSize(45),
                              child: Button(
                                title: 'Cancel DND',
                                color: kRedColor,
                                textcolor: kWhiteColor,
                                onTap: () {
                                  CustomPopup(context,
                                      title: ' Cancel DND',
                                      message:
                                          'Are you sure you want to CancelDND ?',
                                      primaryBtnTxt: 'Ok', primaryAction: () {
                                    context
                                        .read<HouseKeepingProviderImpl>()
                                        .hkpStates(
                                            hkpReserId: housekeepingData
                                                    ?.hkp?.hkpReservationId ??
                                                '',
                                            updateLog: housekeepingData
                                                ?.hkp?.updateLog,
                                            term: 'MarkAsDirty');

                                    context
                                        .read<HouseKeepingProviderImpl>()
                                        .hkpStatesRes;
                                  },
                                      secondaryBtnTxt: 'CANCEL',
                                      secondaryAction: () {});
                                },
                              ),
                            )
                      // Container(
                      //   padding: EdgeInsets.only(left: kFlexibleSize(6)),
                      //   width: kFlexibleSize(110),
                      //   height: kFlexibleSize(45),
                      //   child: BaseAppButton(
                      //     title: 'New Request',
                      //     color: kPrimaryColor,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
