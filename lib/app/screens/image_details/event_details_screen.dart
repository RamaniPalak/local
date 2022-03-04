import 'package:flutter/material.dart';
import 'package:local/app/data/entity/res_entity/res_event.dart';
import 'package:local/app/providers/list_provider.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';
import 'package:local/app/views/common_images.dart';
import 'package:local/app/views/loading_small.dart';
import 'package:local/app/views/network_image.dart';
import 'package:provider/provider.dart';


class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({Key? key,this.eventID}) : super(key: key);

  final String? eventID;

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {

  @override
  void initState() {
    super.initState();
    print(widget.eventID);

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<ListProviderImpl>().getEvent(event: widget.eventID );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: body(),
    );
  }

  Widget body() {

    final event = context.watch<ListProviderImpl>();

    final data = event.getEventDetailRes?.data?.data?.first;

    if (event.getEventDetailRes?.state == Status.LOADING) {
      return Center(child: LoadingSmall());
    }

    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: size.height * 0.37,
              child: Hero(
                tag: '${event.selectedEvent}',
                child: CustomNetWorkImage(
                    url:  '${data?.eventImage ?? eventImg}',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(kFlexibleSize(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${data?.eventName ?? '-'}',
                        style: TextStyle(
                            color: kBlackColor,
                            fontSize: kBigFontSize,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: kFlexibleSize(5)),
                      Text(
                        '${data?.contactPerson ?? '-'}',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: kGreyColor,
                          fontSize: kRegularFontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: kFlexibleSize(15)),
                  Container(height: 1, color: dividerColor),
                  SizedBox(height: kFlexibleSize(15)),
                  Column(
                    children: [
                      leadingIconWidget(
                          leading: clockBlackImage,
                          text: '${data?.startTime ?? '-'}'),
                      SizedBox(height: kFlexibleSize(10)),
                      leadingIconWidget(
                          leading: calendarBlackImage, text: '${data?.startDate ?? '-'}'),
                      SizedBox(height: kFlexibleSize(10)),
                      leadingIconWidget(
                          leading: callImage, text:'${data?.contactNumber ?? '-'}'),
                    ],
                  ),
                  SizedBox(height: kFlexibleSize(15)),
                  Container(height: 1, color: dividerColor),
                  SizedBox(height: kFlexibleSize(15)),
                  Text(
                    "${data?.eventDescription ?? '-'}",
                    style: kLongTitleStyle,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row leadingIconWidget({required Widget leading, required String text}) {
    return Row(
      children: [
        Container(
            height: kFlexibleSize(16),
            width: kFlexibleSize(16),
            child: leading),
        SizedBox(
          width: kFlexibleSize(10),
        ),
        Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.black,
              fontSize: kMediumFontSize,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
