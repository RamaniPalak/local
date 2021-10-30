import 'package:flutter/material.dart';
import 'package:local/app/utils/constants.dart';

class DateComponent extends StatelessWidget {
  const DateComponent(
      {Key? key, this.title, this.date, this.color, this.titleColor})
      : super(key: key);

  final String? title;
  final String? date;
  final Color? color;
  final Color? titleColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: kFlexibleSize(40),
      height: kFlexibleSize(70),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: kFlexibleSize(13)),
            child: Text(
              title!,
              style: TextStyle(
                color: titleColor,
                fontSize: kRegularFontSize,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: kFlexibleSize(8)),
            child: Text(
              date!,
              style: TextStyle(
                color: titleColor,
                fontSize: kMediumFontSize,
                fontWeight: FontWeight.w900,
              ),
            ),
          )
        ],
      ),
    );
  }
}
