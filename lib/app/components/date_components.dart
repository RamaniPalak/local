import 'package:flutter/material.dart';
import 'package:local/app/utils/constants.dart';

class DateComponent extends StatelessWidget {
   DateComponent(
      {Key? key, this.title, this.date, this.colors, this.titleColor,this.isSelected})
      : super(key: key);

  final String? title;
  final String? date;
  final Color? colors;
  final Color? titleColor;
  final bool? isSelected ;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: kFlexibleSize(40),
      height: kFlexibleSize(70),
        decoration: BoxDecoration(
                 border: isSelected == true ? Border.all() : null ,
        color: colors,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: kFlexibleSize(13)),
            child: Text(
              title ?? '',
              style: TextStyle(
                color: titleColor,
                fontSize: kRegularFontSize,
                fontWeight: FontWeight.w400,
                  fontFamily: kRegularFonts
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: kFlexibleSize(8)),
            child: Text(
              date ?? '',
              style: TextStyle(
                color: titleColor,
                fontSize: kMediumFontSize,
                fontWeight: FontWeight.w900,
                fontFamily: kRegularFonts
              ),
            ),
          )
        ],
      ),
    );
  }
}
