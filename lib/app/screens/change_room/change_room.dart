import 'package:flutter/material.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/base_button.dart';
import 'package:local/app/views/date_picker.dart';
import 'package:local/app/views/textfield_common.dart';

class ChangeRoomScreen extends StatefulWidget {
  const ChangeRoomScreen({Key? key}) : super(key: key);

  @override
  State<ChangeRoomScreen> createState() => _ChangeRoomScreenState();
}

class _ChangeRoomScreenState extends State<ChangeRoomScreen> {
  int _value = 0;

  var notices = [
    'Move Room',
  ];

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
                  TextFieldCommon(title: 'RES#', hint: 'RES'),
                  SizedBox(height: kFlexibleSize(20)),
                  datePicker(title: 'Date of issue', hint: 'Select Date'),
                  SizedBox(height: kFlexibleSize(20)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Notice Type',
                        style: kLongTitleStyle,
                      ),
                      SizedBox(height: kFlexibleSize(10)),
                      for (int i = 1; i <= notices.length; i++)
                        Container(
                          height: kFlexibleSize(25),
                          child: Row(
                            children: [
                              Container(
                                child: Radio<int>(
                                  value: i,
                                  splashRadius: 0.0,
                                  groupValue: _value,
                                  activeColor: kPrimaryColor,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value ?? 0;
                                      print(_value);
                                    });
                                  },
                                ),
                                width: kFlexibleSize(20),
                              ),
                              SizedBox(width: kFlexibleSize(10)),
                              Text('${notices[i - 1]}', style: kAppBarTitle),
                            ],
                          ),
                        )
                    ],
                  ),
                  SizedBox(height: kFlexibleSize(20)),
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
          Container(
            padding: EdgeInsets.only(
                left: kFlexibleSize(30), right: kFlexibleSize(30)),
            child: BaseAppButton(
              title: 'SUBMIT',
              color: kPrimaryColor,
            ),
          ),
          SizedBox(height: kFlexibleSize(20)),
        ],
      )),
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '$hint',
                  hintStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }
}
