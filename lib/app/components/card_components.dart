import 'package:flutter/material.dart';
import 'package:local/app/components/common_components.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/common_images.dart';

class CardComponents extends StatelessWidget {
  CardComponents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kFlexibleSize(130),
      width: kFlexibleSize(335),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(kFlexibleSize(10)),
            child: Container(
                height: kFlexibleSize(100),
                width: kFlexibleSize(80),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kFlexibleSize(10)),
                  child: Container(color: Colors.white, child: cardImage),
                )),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: kFlexibleSize(5),
                      right: kFlexibleSize(20),
                      top: kFlexibleSize(10)),
                  child: Text(
                    'Lorem ipsum dolor sit amet, ipsum is consectetur adipiscing elit ipsum dolor sit amet.',
                    style: kRegularText,
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: kFlexibleSize(5), top: kFlexibleSize(5)),
                  child: prefixTitle('7:00 am to 9:00 am', clockImage),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: kFlexibleSize(5),
                      top: kFlexibleSize(5),
                      bottom: kFlexibleSize(15)),
                  child: prefixTitle('Jan 4 2021', calendarImage),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
