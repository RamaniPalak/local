import 'package:flutter/material.dart';
import 'package:local/app/data/entity/req_entity/req_insert_notice.dart';
import 'package:local/app/data/entity/res_entity/res_reservation.dart';
import 'package:local/app/providers/notice_provider.dart';
import 'package:local/app/screens/base/base_state_full.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';
import 'package:local/app/utils/reservation.dart';
import 'package:local/app/utils/show_snack_bar.dart';
import 'package:local/app/views/base_button.dart';
import 'package:local/app/views/date_pick_view.dart';
import 'package:provider/provider.dart';

class NewNoticeScreen extends BasePage {
  NewNoticeScreen({Key? key}) : super(key: key);

  @override
  State<NewNoticeScreen> createState() => _NewNoticeScreenState();
}

class _NewNoticeScreenState extends BaseState<NewNoticeScreen> {
  int _value = 0;

  var notices = ['Checkout'];

  reservationDetail() async {
    var res = await Reservation.shared.getUser;

    setState(() {
      reservationData = res;
    });
  }

  @override
  void initState() {
    super.initState();
    reservationDetail();
  }

  ResReservationData? reservationData;

  TextEditingController noteController = TextEditingController();

  DateTime? selectedStartDate;
  String? value;

  insertNotice() async {
    try {

      if(noteController.text.isEmpty){
        throw 'Please enter note';
      }
      if(selectedStartDate == null){
        throw 'Please select date';
      }

      final provider = Provider.of<NoticeProviderImpl>(context, listen: false);

      provider.noticedata =
          Notice(note: noteController.text, dateOfIssue: selectedStartDate!);

      await provider.insertNotice();

      handleRes(res: provider.insertNoticeRes!, context: context);

      if (provider.insertNoticeRes?.state == Status.COMPLETED) {
        Navigator.of(context).pop(true);
      } else {
        throw 'something went wrong';
      }
    } catch (e) {
      ShowSnackBar(context: context, message: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F3F7),
      appBar: AppBar(
        title: const Text(
          'New Notice',
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(15)),
              child: Column(
                children: [
                  textField(title: 'RES#', hint: 'RES'),
                  SizedBox(height: kFlexibleSize(20)),
                  DatePickView(
                    title: 'Select Date',
                    selectedDate: (date) {
                      setState(() {
                        selectedStartDate = date;
                      });
                    },
                    passedDate: selectedStartDate,
                  ),
                  SizedBox(height: kFlexibleSize(20)),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: <Widget>[
                  //     Text(
                  //       'Notice Type',
                  //       style: kLongTitleStyle,
                  //     ),
                  //     SizedBox(height: kFlexibleSize(10)),
                  //     for (int i = 1; i <= notices.length; i++)
                  //       Container(
                  //         height: kFlexibleSize(25),
                  //         child: Row(
                  //           children: [
                  //             Container(
                  //               child: Radio<int>(
                  //                 value: i,
                  //                 splashRadius: 0.0,
                  //                 groupValue: _value,
                  //                 activeColor: kPrimaryColor,
                  //                 onChanged: (value) {
                  //                   setState(() {
                  //                     _value = value ?? 0;
                  //                     print(_value);
                  //                   });
                  //                 },
                  //               ),
                  //               width: kFlexibleSize(20),
                  //             ),
                  //             SizedBox(width: kFlexibleSize(10)),
                  //             Text('${notices[i - 1]}',
                  //                 style: kAppBarTitle),
                  //           ],
                  //         ),
                  //       )
                  //   ],
                  // ),
                  // SizedBox(height: kFlexibleSize(20)),
                  Column(
                    children: [
                      Text(
                        'Note',
                        style: kLongTitleStyle,
                      ),
                      SizedBox(height: kFlexibleSize(6)),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: kFlexibleSize(15)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(kFlexibleSize(10))),
                        child: TextField(
                          maxLines: 4,
                          style: kLongTitleStyle,
                          controller: noteController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Description',
                              hintStyle: kLightStyle),
                        ),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                  ),
                  SizedBox(height: kFlexibleSize(20)),
                ],
              ),
            ),
          )),
          btn(),
          SizedBox(height: kFlexibleSize(20)),
        ],
      )),
    );
  }

  Widget btn() {

   final isLoading = context.watch<NoticeProviderImpl>().insertNoticeRes?.state == Status.LOADING;

    return Container(
      padding:
          EdgeInsets.only(left: kFlexibleSize(30), right: kFlexibleSize(30)),
      child: BaseAppButton(
        title: 'SUBMIT',
        isLoading: isLoading,
        color: kPrimaryColor,
        onTap: () {
          insertNotice();
        },
      ),
    );
  }

  Container textField({required String title, required String hint}) {
    return Container(
      child: Column(
        children: [
          Text(
            '$title',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 6),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextField(
              readOnly: true,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '${reservationData?.reservationNo ?? ''}',
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }
}
