import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local/app/providers/message_provider.dart';
import 'package:local/app/screens/base/base_state_full.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';
import 'package:local/app/utils/show_snack_bar.dart';
import 'package:local/app/views/common_images.dart';
import 'package:local/app/views/loading_small.dart';
import 'package:provider/provider.dart';

class MessageToFrontDeskScreen extends BasePage {
  MessageToFrontDeskScreen({Key? key}) : super(key: key);

  @override
  State<MessageToFrontDeskScreen> createState() =>
      _MessageToFrontDeskScreenState();
}

class _MessageToFrontDeskScreenState
    extends BaseState<MessageToFrontDeskScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read<MessageProviderImpl>().getMsgMsgFrontDeskById();
    });
    //
    // SchedulerBinding.instance!.addPostFrameCallback((_) {
    //   Timer(
    //       Duration(milliseconds: 400),
    //           () => _scrollController
    //           .jumpTo(_scrollController.position.maxScrollExtent));
    // });
  }

  TextEditingController msgController = TextEditingController();

   ScrollController _scrollController =  ScrollController();

  insertMsg() async {
    try {
      if (msgController.text.trim().isEmpty) {
        throw 'Please enter message';
      }

      final provider = Provider.of<MessageProviderImpl>(context, listen: false);
      await provider.insertMsg(msg: msgController.text);

      Timer(
          Duration(milliseconds: 400),
          () => _scrollController
              .jumpTo(_scrollController.position.maxScrollExtent));

      handleRes(res: provider.msgInsertRes!, context: context);

      if (provider.msgInsertRes?.state == Status.COMPLETED) {
        // Navigator.of(context).pop(true);
      } else {
        throw 'something went wrong';
      }
    } catch (e) {
      ShowSnackBar(context: context, message: e.toString());
    }
  }

  void clearText() {
    msgController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F3F7),
      appBar: AppBar(
        title: const Text(
          'Message To FrontDesk',
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            getMessages(),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: kFlexibleSize(15), vertical: kFlexibleSize(10)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: kFlexibleSize(15)),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(kFlexibleSize(10))),
                      child: TextField(
                        controller: msgController,
                        style: TextStyle(
                            fontSize: kMediumFontSize,
                            fontWeight: FontWeight.w700),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Write here...',
                            hintStyle: TextStyle(
                                fontSize: kRegularFontSize,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ),
                  SizedBox(width: kFlexibleSize(10)),
                  InkWell(
                    onTap: () {
                      insertMsg();
                      clearText();
                    },
                    child: Container(
                      width: kFlexibleSize(45),
                      height: kFlexibleSize(45),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(23)),
                      child: Center(
                        child: Container(
                            height: kFlexibleSize(18),
                            width: kFlexibleSize(18),
                            child: sendImage),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getMessages() {
    final getMsg = context.watch<MessageProviderImpl>();

    final data = getMsg.getMsgRes?.data?.data;

    if (getMsg.getMsgRes?.state == Status.LOADING) {
      return Center(child: LoadingSmall());
    }

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(15)),
        child: ListView.builder(
          shrinkWrap: true,
          controller: _scrollController,
          itemCount: data?.length,
          itemBuilder: (context, index) {
            return data?[index].associationTypeTerm == 'User'
                ? userChatBubble(
                    text: '${data?[index].message}',
                    time: '${data?[index].startTime}')
                : frontDeskChatBubble(
                    text: '${data?[index].message}',
                    time: '${data?[index].startTime}');
          },
        ),
      ),
    );
  }

  Container frontDeskChatBubble({required String text, required String time}) {
    return Container(
      padding:
          EdgeInsets.only(top: kFlexibleSize(10), right: kFlexibleSize(45)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: kFlexibleSize(35),
            width: kFlexibleSize(35),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kFlexibleSize(17)),
                color: Colors.white),
            child: femaleProfileImage,
          ),
          SizedBox(width: kFlexibleSize(10)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    '$text',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: kBigFontSize,
                        fontWeight: FontWeight.w400),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: kFlexibleSize(10),
                      horizontal: kFlexibleSize(10)),
                  decoration: BoxDecoration(
                      color: kBgColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(kFlexibleSize(10)),
                          topLeft: Radius.circular(0),
                          bottomLeft: Radius.circular(kFlexibleSize(10)),
                          bottomRight: Radius.circular(kFlexibleSize(10)))),
                ),
                SizedBox(height: kFlexibleSize(5)),
                Text(
                  '$time',
                  style: TextStyle(
                      fontSize: kSmallFontSize,
                      color: const Color(0xff576D7E),
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container userChatBubble({required String text, required String time}) {
    return Container(
      padding: EdgeInsets.only(top: kFlexibleSize(10), left: kFlexibleSize(45)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    '$text ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: kBigFontSize,
                        fontWeight: FontWeight.w400),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: kFlexibleSize(10),
                      horizontal: kFlexibleSize(10)),
                  decoration: BoxDecoration(
                      color: kBgColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(kFlexibleSize(10)),
                          topLeft: Radius.circular(kFlexibleSize(10)),
                          bottomLeft: Radius.circular(kFlexibleSize(10)),
                          bottomRight: Radius.circular(0))),
                ),
                SizedBox(height: kFlexibleSize(5)),
                Text(
                  '$time',
                  style: TextStyle(
                      fontSize: kSmallFontSize,
                      color: const Color(0xff576D7E),
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          SizedBox(width: kFlexibleSize(10)),
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kFlexibleSize(17)),
                color: Colors.white),
            child: maleProfileImage,
          ),
        ],
      ),
    );
  }
}
