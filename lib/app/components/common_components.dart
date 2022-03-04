import 'package:flutter/material.dart';
import 'package:local/app/utils/constants.dart';

Widget prefixTitle(String text, Image image, {Color? color, bool? isCenter}) {
  return Row(
    mainAxisAlignment:
        isCenter == false ? MainAxisAlignment.start : MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: kFlexibleSize(12),
        child: image,
      ),
      SizedBox(
        width: kFlexibleSize(5),
      ),
      Flexible(
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: kGreyColor,
              fontSize: kSmallFontSize,
              fontWeight: FontWeight.w400),
        ),
      ),
    ],
  );
}

Widget keyValueComponent(
    {required String key, required String value, bool? isCenter}) {
  return Row(
    children: [
      Text('$key : ', style: kLightTitle),
      Expanded(
        child: Text('$value',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontSize: kRegularFontSize,
                fontWeight: FontWeight.w700)),
      )
    ],
  );
}


Widget keyValueReservComponent(
    {required String key, required String value, bool? isCenter}) {
  return Row(
    children: [
      Text('$key : ', style: TextStyle(
        color: kBlackColor,
        fontFamily: kRegularFonts,
        fontSize: kRegularFontSize,
        fontWeight: FontWeight.w400,
      )),
      Expanded(
        child: Text('$value',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontSize: kRegularFontSize,
                fontWeight: FontWeight.w700)),
      )
    ],
  );
}

Widget btn({required String title, required Color color}) {
  return InkWell(
    child: Container(
        height: kFlexibleSize(25.0),
        width: kFlexibleSize(65.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kFlexibleSize(5)),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: kSmallFontSize,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
        )),
  );
}

Widget leadingIconWidget({required Widget leading, required String text}) {
  return Row(
    children: [
      Container(
          height: kFlexibleSize(18),
          width: kFlexibleSize(16),
          child: leading),
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: kFlexibleSize(10)),
          child: Text(text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: kLongTitleStyle),
        ),
      )
    ],
  );
}

Widget defaultSizeBoxHeight({double? height}) {
  return SizedBox(
    height: kFlexibleSize(height ?? 10.0),
  );
}

Widget defaultSizeBoxWidth({double? width}) {
  return SizedBox(
    width: kFlexibleSize(width ?? 10.0),
  );
}
