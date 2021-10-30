import 'package:flutter/material.dart';
import 'package:local/app/components/history_components.dart';
import 'package:local/app/utils/constants.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          'History',
        ),
      ),
      body: _body(context),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: kFlexibleSize(10),
            ),
            HistoryComponents(),
            SizedBox(
              height: kFlexibleSize(10),
            ),
            HistoryComponents(),
            SizedBox(
              height: kFlexibleSize(10),
            ),
            HistoryComponents(),
            SizedBox(
              height: kFlexibleSize(10),
            ),
          ],
        ),
      ),
    ));
  }
}
