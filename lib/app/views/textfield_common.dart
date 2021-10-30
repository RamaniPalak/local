import 'package:flutter/material.dart';
import 'package:local/app/utils/constants.dart';

class TextFieldCommon extends StatelessWidget {
  TextFieldCommon({Key? key, required this.title, required this.hint,this.controller})
      : super(key: key);

  final String? title;
  final String hint;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding:  EdgeInsets.symmetric(horizontal: kFlexibleSize(20),),
      child: Column(
        children: [
          Text('$title', style: kLongTitleStyle),
          SizedBox(height: kFlexibleSize(6)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(15)),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(kFlexibleSize(10))),
            child: TextField(
              style: kAppBarTitle,
              controller: controller,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: '$hint'),
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }
}
