import 'package:flutter/material.dart';
import 'package:local/app/components/common_components.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/common_images.dart';
import 'package:local/app/views/network_image.dart';

class CardComponents extends StatelessWidget {

  CardComponents({Key? key, this.cardModel}) : super(key: key);

  CardModel? cardModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kFlexibleSize(100),
      width: kFlexibleSize(300),
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
              height: kFlexibleSize(80),
              width: kFlexibleSize(80),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kFlexibleSize(10)),
                child: Container(
                  color: Colors.white,
                  child: Hero(
                    tag: '${cardModel?.eventID}',
                    child: CustomNetWorkImage(url: '${cardModel?.img}'),
                  ),
                ),
              ),
            ),
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
                    '${cardModel?.name ??'-' }',
                    style: kRegularText,
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: kFlexibleSize(5), top: kFlexibleSize(5)),
                  child: prefixTitle('${cardModel?.time ?? '-'}', clockImage),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: kFlexibleSize(5),
                      top: kFlexibleSize(5),
                      bottom: kFlexibleSize(15)),
                  child: prefixTitle('${cardModel?.date ?? '-'}', calendarImage),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class CardModel {
  final String? img;
  final String? name;
  final String? time;
  final String? date;
  final String? eventID;


  CardModel(
      { this.img,
        this.name,
        this.time,
        this.date,
        this.eventID
      });
}
