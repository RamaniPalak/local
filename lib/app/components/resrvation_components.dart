import 'package:flutter/material.dart';
import 'package:local/app/components/common_components.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/base_text_field.dart';

class ReservationComponent extends StatelessWidget {
  ReservationComponent({Key? key, required this.reserv,this.isReserSelect}) : super(key: key);

  final ReservationModel reserv;

  final bool? isReserSelect ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kFlexibleSize(349),
      height: kFlexibleSize(345),
      decoration: isReserSelect == true ? BoxDecoration(
        color: Color(0xffF5F5F5),
        boxShadow:  kCommonBlueShadow ,
        borderRadius: BorderRadius.circular(kFlexibleSize(10)),
      ) : BoxDecoration(
        color: Colors.white,
        //boxShadow:  kCommonBlueShadow ,
        borderRadius: BorderRadius.circular(kFlexibleSize(10)),
      ),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          reservTextField(
            title: 'Room type' ,
            description: '${reserv.roomType ?? '-'}',
          ),
          reservTextField(title: 'RES#', description: '${reserv.resvId ??'-'}'),
          // SizedBox(
          //   height: kFlexibleSize(5),
          // ),
          reservTextField(
              title: 'Check In Date', description: '${reserv.dateIssue ?? '-'}'),

          reservTextField(
              title: 'Check Out Date', description: '${reserv.actionDate ?? ''}'),

          reservTextField(title: 'Room No.', description: '${reserv.roomNo ?? '-'}'),

          reservTextField(
              title: 'Payment Due', description: '${reserv.folioBal ?? '-'}'),

          reservTextField(
              title: 'Company Name', description: '${reserv.companyName ?? '-'}'),

          reservTextField(
              title: 'Property Name', description: '${reserv.propertyName ?? '-'}'),
          SizedBox(
            height: 10,
          )
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
  final String? companyName;
  final String? propertyName;

  ReservationModel(
      {this.roomType,
      this.resvId,
      this.dateIssue,
      this.actionDate,
      this.roomNo,
      this.folioBal,
      this.companyName,
      this.propertyName});
}
