import 'package:flutter/material.dart';
import 'package:local/app/components/common_components.dart';
import 'package:local/app/utils/constants.dart';

class RequestChangeRoomComponent extends StatelessWidget {
  const RequestChangeRoomComponent(
      {Key? key, required this.btncolor, required this.btntext})
      : super(key: key);

  final Color btncolor;
  final String btntext;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kFlexibleSize(335),
      height: kFlexibleSize(160),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kFlexibleSize(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: kFlexibleSize(15),
                  top: kFlexibleSize(15),
                ),
                child: Container(
                  width: kFlexibleSize(230),
                  child:
                      keyValueComponent(key: 'Notice type', value: 'Move Room'),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    right: kFlexibleSize(15),
                    left: kFlexibleSize(10),
                    top: kFlexibleSize(15)),
                child: btn(title: btntext, color: btncolor),
              )
            ],
          ),
          SizedBox(
            height: kFlexibleSize(5),
          ),
          Padding(
            padding: EdgeInsets.only(left: kFlexibleSize(15)),
            child: keyValueComponent(key: 'RES#', value: 'RES-78-21'),
          ),
          SizedBox(
            height: kFlexibleSize(5),
          ),
          Padding(
            padding: EdgeInsets.only(left: kFlexibleSize(15)),
            child: keyValueComponent(key: 'Date Of Issue', value: '25/9/2021'),
          ),
          SizedBox(
            height: kFlexibleSize(5),
          ),
          Padding(
            padding: EdgeInsets.only(left: kFlexibleSize(15)),
            child: keyValueComponent(key: 'Action Date', value: '25/11/2021'),
          ),
          SizedBox(
            height: kFlexibleSize(5),
          ),
          Padding(
            padding: EdgeInsets.only(left: kFlexibleSize(15)),
            child: Text(
              'Lorem ipsum dolor sit amet, dolor is consectetur adipiscing elit.',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  color: kFontColor,
                  fontSize: kRegularFontSize,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
