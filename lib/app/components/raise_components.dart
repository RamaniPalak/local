import 'package:flutter/material.dart';
import 'package:local/app/components/common_components.dart';
import 'package:local/app/utils/constants.dart';

class RaiseComponent extends StatelessWidget {
  const RaiseComponent({Key? key, required this.btncolor}) : super(key: key);

  final Color btncolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kFlexibleSize(335),
      height: kFlexibleSize(115),
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
                  child: Text(
                    'Lorem ipsum dolor sit amet, dolor is consectetur adipiscing elit.',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        color: kFontColor,
                        fontSize: kRegularFontSize,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    right: kFlexibleSize(15), left: kFlexibleSize(10)),
                child: btn(title: 'High', color: btncolor),
              )
            ],
          ),
          SizedBox(
            height: kFlexibleSize(10),
          ),
          Padding(
            padding: EdgeInsets.only(left: kFlexibleSize(15)),
            child: keyValueComponent(key: 'Related To', value: 'Housekeeping'),
          ),
          Padding(
            padding: EdgeInsets.only(left: kFlexibleSize(15)),
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
                  child: Text('Open',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: kRegularFontSize,
                          fontWeight: FontWeight.w700)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
