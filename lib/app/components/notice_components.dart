import 'package:flutter/material.dart';
import 'package:local/app/components/common_components.dart';
import 'package:local/app/utils/constants.dart';

class NoticeComponent extends StatelessWidget {
  NoticeComponent({Key? key,  this.btncolor, required this.btntext,this.noticeModel})
      : super(key: key);

  final Color? btncolor;
  final String btntext;
  final NoticeModel? noticeModel;

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.only(bottom: kFlexibleSize(20),
           left: kFlexibleSize(20),
           right: kFlexibleSize(20),),
      width: kFlexibleSize(345),
      height: kFlexibleSize(150),
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
                      keyValueComponent(key: 'Notice type', value: '${noticeModel?.Checkout ?? '-'}'),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    right: kFlexibleSize(15),
                    top: kFlexibleSize(15)),
                child: btn(title: btntext, color: noticeModel?.color ?? kPrimaryColor  ),
              )
            ],
          ),
          SizedBox(
            height: kFlexibleSize(5),
          ),
          Padding(
            padding: EdgeInsets.only(left: kFlexibleSize(15)),
            child: keyValueComponent(key: 'RES#', value: '${noticeModel?.resvId ??'-'}'),
          ),
          SizedBox(
            height: kFlexibleSize(5),
          ),
          Padding(
            padding: EdgeInsets.only(left: kFlexibleSize(15)),
            child: keyValueComponent(key: 'Date Of Issue', value: '${noticeModel?.dateIssue ??'-'}'),
          ),
          SizedBox(
            height: kFlexibleSize(5),
          ),
          Padding(
            padding: EdgeInsets.only(left: kFlexibleSize(15)),
            child: keyValueComponent(key: 'Action Date', value: '${noticeModel?.actionDate ??'-'}'),
          ),
          SizedBox(
            height: kFlexibleSize(5),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: kFlexibleSize(15),right: kFlexibleSize(15),bottom: kFlexibleSize(5)),
              child: Text(
                '${noticeModel?.note ?? '-'}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    color: kFontColor,
                    fontSize: kRegularFontSize,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NoticeModel {
  final String? Checkout;
  final String? resvId;
  final String? dateIssue;
  final String? actionDate;
  final String? note;
  final Color? color;


  NoticeModel(
      {this.Checkout,
        this.resvId,
        this.dateIssue,
        this.actionDate,
        this.note,
        this.color
       });
}
