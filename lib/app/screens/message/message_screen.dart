import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/common_images.dart';

class MessageToFrontDeskScreen extends StatelessWidget {
  const MessageToFrontDeskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F3F7),
      appBar: AppBar(
        title: Text(
          'Message To FrontDesk',
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(15)),
                child: ListView.builder(
                  reverse: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return index.isEven
                        ? otherUserChatBubble()
                        : selfUserChatBubble();
                  },
                ),
              )),
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
                    Container(
                      width: kFlexibleSize(45),
                      height: kFlexibleSize(45),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(23)),
                      child: Center(child: sendImage),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container otherUserChatBubble() {
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
                  'this is receiver this is receiver ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: kBigFontSize,
                      fontWeight: FontWeight.w400),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: kFlexibleSize(10), horizontal: kFlexibleSize(10)),
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
                '10:48 AM',
                style: TextStyle(
                    fontSize: kSmallFontSize,
                    color: const Color(0xff576D7E),
                    fontWeight: FontWeight.w400),
              )
            ],
          ))
        ],
      ),
    );
  }

  Container selfUserChatBubble() {
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
                  'this is sender this is sender this is sender this is sender this is sender ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: kBigFontSize,
                      fontWeight: FontWeight.w400),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: kFlexibleSize(10), horizontal: kFlexibleSize(10)),
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
                '10:48 AM',
                style: TextStyle(
                    fontSize: kSmallFontSize,
                    color: const Color(0xff576D7E),
                    fontWeight: FontWeight.w400),
              )
            ],
          )),
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
