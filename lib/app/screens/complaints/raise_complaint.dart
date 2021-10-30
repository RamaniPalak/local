import 'package:flutter/material.dart';
import 'package:local/app/components/raise_components.dart';
import 'package:local/app/screens/complaints/new_complaint_screen.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/common_images.dart';

class RaiseComplaint extends StatefulWidget {
  const RaiseComplaint({Key? key}) : super(key: key);

  @override
  _RaiseComplaintState createState() => _RaiseComplaintState();
}

class _RaiseComplaintState extends State<RaiseComplaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Raise Complaints',
        ),
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => NewComplaintsScreen()));
        },
        child: Container(
            height: kFlexibleSize(20),
            width: kFlexibleSize(20),
            child: addImage),
        backgroundColor: kPrimaryColor,
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            left: kFlexibleSize(20),
            right: kFlexibleSize(20),
            top: kFlexibleSize(10)),
        child: Column(
          children: [
            RaiseComponent(
              btncolor: kRedColor,
            ),
            SizedBox(
              height: kFlexibleSize(10),
            ),
            RaiseComponent(
              btncolor: yellowColor,
            ),
            SizedBox(
              height: kFlexibleSize(10),
            ),
            RaiseComponent(
              btncolor: kGreyColor,
            ),
            SizedBox(
              height: kFlexibleSize(10),
            ),
          ],
        ),
      ),
    ));
  }
}
