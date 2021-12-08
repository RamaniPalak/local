import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local/app/components/common_components.dart';
import 'package:local/app/utils/constants.dart';

class RaiseComponent extends StatelessWidget {
   RaiseComponent({Key? key,  this.btncolor,this.raiseModel,this.btntext,this.Statustext}) : super(key: key);

  final Color? btncolor;
  RaiseModel? raiseModel;
   final String? btntext;
   final String? Statustext;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: kFlexibleSize(20),
          left: kFlexibleSize(20),
          right: kFlexibleSize(20),),
      width: kFlexibleSize(335),
      height: kFlexibleSize(130),
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
                  top: kFlexibleSize(12),
                ),
                child: Container(
                  width: kFlexibleSize(230),
                  child: Text(
                    '${raiseModel?.title ?? ''}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        color: kFontColor,
                        fontSize: kRegularFontSize,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: kFlexibleSize(15), left: kFlexibleSize(10), top: kFlexibleSize(15)),
                child: Container(
                  width: kFlexibleSize(60),
                  height: kFlexibleSize(25),
                  child: btn(title: btntext ??'', color: raiseModel?.color ?? kPrimaryColor),
                ),
              )
            ],
          ),
          SizedBox(
            height: kFlexibleSize(10),
          ),
          Padding(
            padding: EdgeInsets.only(left: kFlexibleSize(15)),
            child: keyValueComponent(key: 'Related To', value: '${raiseModel?.relatedTo ?? ''}'),
          ),
          Padding(
            padding: EdgeInsets.only(left: kFlexibleSize(15),bottom: kFlexibleSize(5)),
            child: Row(
              children: [
                Text('Status',
                    style: TextStyle(
                      color: kGreyColor,
                      fontSize: kRegularFontSize,
                      fontWeight: FontWeight.w400,
                    )),
                Container(
                  padding: EdgeInsets.only(left: kFlexibleSize(3)),
                  //flex: (isCenter == false) ? 1 : 0,
                  child: Text(Statustext ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: raiseModel?.statusColor ?? kPrimaryColor,
                          fontSize: kRegularFontSize,
                          fontWeight: FontWeight.w700)),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: kFlexibleSize(15),
                bottom: kFlexibleSize(5),
                right: kFlexibleSize(15),
              ),
              child: Container(
                width: double.infinity,
                child: Text(
                  '${raiseModel?.note ?? ''}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                  style: TextStyle(
                      color: kFontColor,
                      fontSize: kRegularFontSize,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RaiseModel {
  final String? title;
  final String? relatedTo;
  final String? status;
  final Color? color;
  final Color? statusColor;
  final String? note;


  RaiseModel(
      {this.title,
        this.relatedTo,
        this.status,
        this.color,
        this.statusColor,
        this.note
      });
}
