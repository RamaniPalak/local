import 'package:flutter/material.dart';
import 'package:local/app/components/card_components.dart';
import 'package:local/app/components/date_components.dart';
import 'package:local/app/components/home_profile_components.dart';
import 'package:local/app/data/entity/res_entity/res_event.dart';
import 'package:local/app/data/entity/res_entity/res_reservation.dart';
import 'package:local/app/providers/auth_provider.dart';
import 'package:local/app/providers/housekeeping_provider.dart';
import 'package:local/app/providers/list_provider.dart';
import 'package:local/app/providers/profile_provider.dart';
import 'package:local/app/screens/base/base_state_full.dart';
import 'package:local/app/screens/helper_screen/side_menu_screen.dart';
import 'package:local/app/screens/image_details/event_details_screen.dart';
import 'package:local/app/screens/message/message_screen.dart';
import 'package:local/app/screens/profile/profile_screen.dart';
import 'package:local/app/screens/schedule/housekeeping_schedule.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';
import 'package:local/app/utils/reservation.dart';
import 'package:local/app/utils/user_prefs.dart';
import 'package:local/app/views/base_button.dart';
import 'package:local/app/views/common_images.dart';
import 'package:local/app/views/loading_small.dart';
import 'package:provider/provider.dart';

class HomeScreen extends BasePage {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> {
  bool? isCenter;

  ResReservationData? reservationData;
  LocalUser? userData;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      getInitialData();
      context.read<ListProviderImpl>().getEvent();
      context.read<HouseKeepingProviderImpl>().houseKeepingDate();

    });

  }


  getInitialData() async {
    await context.read<AuthProviderImpl>().reservationUser();
    await context.read<ProfileProviderImpl>().userDetail();

    reservationDetail();
    user();
  }

  reservationDetail() async {
    var res = await Reservation.shared.getReservation;

    setState(() {
      reservationData = res;
    });
  }

  user() async {
    final user = await UserPrefs.shared.getUser;

    print('cool');
    print(user.displayName);

    setState(() {
      userData = user;
    });
  }


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
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(right: kFlexibleSize(20)),
              child: Container(
                width: kFlexibleSize(20),
                height: kFlexibleSize(20),
                child: notificationImage,
              ),
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
        child: Column(
      children: [
        Expanded(
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
                    ProfileComponents(
                      reservationData: reservationData,
                      userData: userData,
                      onTap: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext) => ProfileScreen()))
                            .then((value) {
                          // if (value == true) {
                          user();
                          reservationDetail();
                          // }
                          //Update user data
                        });
                      },
                    ),
                    cardEvent(),
                    SizedBox(
                      height: kFlexibleSize(25),
                    ),
                    houseKeeping(),
                    SizedBox(
                      height: kFlexibleSize(25),
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
                        title: 'Message To FrontDesk ',
                      ),
                    ),
                    SizedBox(
                      height: kFlexibleSize(33),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
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

    return hasError ?  Center(
      child: NoEventFound(
        title: 'No HouseKeeping data ',
        retryCall: () {
                  context.read<HouseKeepingProviderImpl>().houseKeepingDate();
                }),
    ): Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              context.read<HouseKeepingProviderImpl>().setIndex(index: 0);
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
                        color: kBlackColor,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'View All',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: kBlackColor,
                          fontSize: kSmallFontSize,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: kFlexibleSize(5),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: kFlexibleSize(20)),
                      child: Container(
                        width: kFlexibleSize(20),
                        height: kFlexibleSize(20),
                        child: Center(
                          child: Container(
                            width: kFlexibleSize(15),
                            height: kFlexibleSize(5),
                            child: arrowRightBlackImage,
                          ),
                        ),
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
                  itemCount: data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){

                        context.read<HouseKeepingProviderImpl>().setIndex(index: index);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext) => HouseKeepingScreen()));

                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: kFlexibleSize(5), right: kFlexibleSize(5)),
                        child: DateComponent(
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
        ],
      ),
    );
  }

  Widget cardEvent() {
    final event = context.watch<ListProviderImpl>();

    final hasError = event.getEventRes?.state == Status.ERROR ||
        event.getEventRes?.state == Status.UNAUTHORISED || event.getEventRes?.data?.statusCode == 200;

    if(event.getEventRes?.state == Status.LOADING){
      return Center(child: LoadingSmall());
    }

    final data = event.getEventRes?.data?.data;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: kFlexibleSize(20)),
                child: Text(
                  'Events ',
                  style: TextStyle(
                    fontSize: kRegularFontSize,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: kFlexibleSize(10),
        ),
        Container(
          height: kFlexibleSize(100),
          width: double.infinity,
          child: hasError
              ? const Center(
                  child: NoEventFound(
                    title: 'No Events Found',
                  ),
                )
              : listView(data),
        ),
      ],
    );
  }

  ListView listView(List<ResEventData>? data) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: data?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => EventDetailScreen(
                          eventID: data?[index].eventId,
                        )));
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: kFlexibleSize(5),
              right: kFlexibleSize(5),
            ),
            child: CardComponents(
              cardModel: CardModel(
                  eventID: data?[index].eventId ?? '-',
                  name: data?[index].eventName ?? '-',
                  date: data?[index].startDate ?? '-',
                  time: data?[index].startTime ?? '-',
                  img: data?[index].eventImage),
            ),
          ),
        );
      },
    );
  }
}

class NoEventFound extends StatelessWidget {
  const NoEventFound({Key? key, this.retryCall, this.title}) : super(key: key);

  final Function? retryCall;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: kFlexibleSize(100),
          width: kFlexibleSize(300),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.only(bottom: 5, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  title ?? 'No Data Found',
                  style:
                      TextStyle(color: Colors.black, fontSize: kMediumFontSize),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              if (retryCall != null)
                ButtonBorder(
                  text: 'RETRY',
                  onTap: () {
                    retryCall!();
                  },
                )
            ],
          ),
        ),
      ],
    );
  }
}
