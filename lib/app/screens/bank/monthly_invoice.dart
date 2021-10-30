import 'package:flutter/material.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/common_images.dart';

class MonthlyInvoiceScreen extends StatefulWidget {
  const MonthlyInvoiceScreen({Key? key}) : super(key: key);

  @override
  _MonthlyInvoiceScreenState createState() => _MonthlyInvoiceScreenState();
}

class _MonthlyInvoiceScreenState extends State<MonthlyInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly Invoice',
       ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: kFlexibleSize(20),),
            child: Container(
              width: kFlexibleSize(20),
              height: kFlexibleSize(20),
              child: downloadImage,
            ),
          )
        ],

      ),
      body: _body(context),

    );
  }

  Widget _body(BuildContext context){
    return SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Text('PDF',style: kTitleMediumStyle,),

            ),
          ),

        ));
  }

}
