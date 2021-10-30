import 'package:flutter/material.dart';
import 'package:local/app/components/notice_components.dart';
import 'package:local/app/providers/notice_provider.dart';
import 'package:local/app/screens/notice/new_notice_screen.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';
import 'package:local/app/utils/no_data_found_view.dart';
import 'package:local/app/views/common_images.dart';
import 'package:provider/provider.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  _NoticeScreenState createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<NoticeProviderImpl>().getNotice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notice'),
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext) => NewNoticeScreen())).then((value) {
                if(value == true){
                  context.read<NoticeProviderImpl>().getNotice();
                }
          });
        },
        child: Container(
            height: kFlexibleSize(20),
            width: kFlexibleSize(20),
            child: addImage),
        backgroundColor: kPrimaryColor,
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
        child: Container(
            padding: EdgeInsets.only(
                left: kFlexibleSize(20),
                right: kFlexibleSize(20),
                top: kFlexibleSize(20)),
            child: notice()));
  }

  Widget notice() {
    final notice = context.watch<NoticeProviderImpl>();

    final hasError = notice.getNoticeRes?.state == Status.ERROR ||
        notice.getNoticeRes?.state == Status.UNAUTHORISED;


    if (hasError) {
      return Center(
          child: NoDataFoundView(
              retryCall: () {
                context.read<NoticeProviderImpl>().getNotice();
              },
              title: 'No Profile Data Found'));
    }

    if (notice.getNoticeRes?.state == Status.LOADING) {
      return Center(child: CircularProgressIndicator());
    }

    final data = notice.getNoticeRes?.data?.data?.data;

    return ListView.builder(
        itemCount: data?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return NoticeComponent(
            btntext: '${data?[index].statusTerm}',
            noticeModel: NoticeModel(
                color: data?[index].statusColor,
                Checkout: data?[index].noticeTypeTerm,
                resvId: data?[index].reservationNo,
                dateIssue: data?[index].dateOfIssue,
                actionDate: data?[index].actionDate,
                note: data?[index].note),
          );
        });
  }
}
