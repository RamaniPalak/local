import 'package:flutter/material.dart';
import 'package:local/app/components/common_components.dart';
import 'package:local/app/utils/constants.dart';

class ReservationComponent extends StatelessWidget {
  ReservationComponent({Key? key, required this.reserv}) : super(key: key);

  final ReservationModel reserv;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kFlexibleSize(335),
      height: kFlexibleSize(200),
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
                  child: keyValueComponent(
                      key: 'Room type', value: '${reserv.roomType}'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: kFlexibleSize(5),
          ),
          Padding(
            padding: EdgeInsets.only(left: kFlexibleSize(15)),
            child: keyValueComponent(key: 'RES#', value: '${reserv.resvId}'),
          ),
          SizedBox(
            height: kFlexibleSize(5),
          ),
          Padding(
            padding: EdgeInsets.only(left: kFlexibleSize(15)),
            child: keyValueComponent(
                key: 'Check In Date', value: '${reserv.dateIssue}'),
          ),
          SizedBox(
            height: kFlexibleSize(5),
          ),
          Padding(
            padding: EdgeInsets.only(left: kFlexibleSize(15)),
            child: keyValueComponent(
                key: 'Check Out Date', value: '${reserv.actionDate}'),
          ),
          SizedBox(
            height: kFlexibleSize(5),
          ),
          Padding(
            padding: EdgeInsets.only(left: kFlexibleSize(15)),
            child:
                keyValueComponent(key: 'Room No.', value: '${reserv.roomNo}'),
          ),
          SizedBox(
            height: kFlexibleSize(5),
          ),
          Padding(
            padding: EdgeInsets.only(left: kFlexibleSize(15)),
            child: keyValueComponent(
                key: 'Payment Due', value: '${reserv.folioBal}'),
          ),
          SizedBox(
            height: kFlexibleSize(5),
          ),
          Padding(
            padding: EdgeInsets.only(left: kFlexibleSize(15)),
            child: keyValueComponent(
                key: 'Company Name', value: '${reserv.comapnyName}'),
          ),
          SizedBox(
            height: kFlexibleSize(5),
          ),
          Padding(
            padding: EdgeInsets.only(left: kFlexibleSize(15)),
            child: keyValueComponent(
                key: 'Property Name', value: '${reserv.propertyName}'),
          ),
        ],
      ),
    );
  }
}

class ReservationModel {
  final String? roomType;
  final String? resvId;
  final String? dateIssue;
  final String? actionDate;
  final String? roomNo;
  final String? folioBal;
  final String? comapnyName;
  final String? propertyName;

  ReservationModel(
      {this.roomType,
      this.resvId,
      this.dateIssue,
      this.actionDate,
      this.roomNo,
      this.folioBal,
      this.comapnyName,
      this.propertyName});
}
