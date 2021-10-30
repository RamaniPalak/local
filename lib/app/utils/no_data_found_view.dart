import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local/app/views/base_button.dart';

import 'constants.dart';

class NoDataFoundView extends StatelessWidget {
  const NoDataFoundView({Key? key,this.retryCall, this.title}) : super(key: key);

  final Function? retryCall;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(title ?? 'No Data Found',style: TextStyle(
              color: Colors.grey,
              fontSize: kMediumFontSize
          ),),
        ),
        if(retryCall != null)
        ButtonBorder(text: 'RETRY',onTap: (){
          retryCall!();
        },)
      ],
    );
  }
}
