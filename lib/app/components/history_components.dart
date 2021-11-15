import 'package:flutter/material.dart';
import 'package:local/app/components/common_components.dart';
import 'package:local/app/utils/constants.dart';

class HistoryComponents extends StatelessWidget {
  HistoryComponents({Key? key, this.historyModel, this.btntext})
      : super(key: key);

  final HistoryModel? historyModel;
  final String? btntext;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kFlexibleSize(335),
      height: kFlexibleSize(195),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: kFlexibleSize(15),
              top: kFlexibleSize(15),
            ),
            child: Text(
              '${historyModel?.propertyName ?? ''}',
              style: kAppBarTitle,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: kFlexibleSize(15),
              top: kFlexibleSize(10),
            ),
            child: keyValueComponent(
                key: 'Room No', value: ' ${historyModel?.roomNo ?? ''}'),
          ),
          Container(
            padding: EdgeInsets.only(
              left: kFlexibleSize(15),
              top: kFlexibleSize(10),
            ),
            child: keyValueComponent(
                key: 'Start Date & Time',
                value: '${historyModel?.checkInDate ?? '-'}'),
          ),
          Container(
            padding: EdgeInsets.only(
              left: kFlexibleSize(15),
              top: kFlexibleSize(10),
            ),
            child: keyValueComponent(
                key: 'End Date & Time',
                value: '${historyModel?.checkOutDate ?? '-'}'),
          ),
          Padding(
            padding: EdgeInsets.only(top: kFlexibleSize(15)),
            child: Divider(
              height: 1,
              thickness: 1,
              color: kGreyColor.withOpacity(0.15),
            ),
          ),
          SizedBox(
            height: kFlexibleSize(60),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(kFlexibleSize(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '₹${historyModel?.payment}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: kBigFontSize,
                            fontWeight: FontWeight.w900,
                            color: kPrimaryColor),
                      ),
                      Text(
                        'Total Payment',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: kGreyColor,
                            fontSize: kMediumFontSize,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )),
                Container(
                  width: kFlexibleSize(1),
                  height: double.infinity,
                  color: kGreyColor.withOpacity(0.15),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(kFlexibleSize(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${historyModel?.status ?? ''}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: kBigFontSize,
                            fontWeight: FontWeight.w900,
                            color: historyModel?.color),
                      ),
                      Text(
                        ' Status',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: kGreyColor,
                            fontSize: kMediumFontSize,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HistoryModel {
  final String? propertyName;
  final String? roomNo;
  final String? checkInDate;
  final String? checkOutDate;
  final double? payment;
  final Color? color;
  final String? status;

  HistoryModel(
      {this.propertyName,
      this.roomNo,
      this.checkInDate,
      this.checkOutDate,
      this.payment,
      this.color,
      this.status});
}
