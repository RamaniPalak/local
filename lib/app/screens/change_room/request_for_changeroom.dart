import 'package:flutter/material.dart';
import 'package:local/app/components/request_changeroom_component.dart';
import 'package:local/app/screens/change_room/change_room.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/common_images.dart';

class RequestChangeRoomScreen extends StatefulWidget {
  const RequestChangeRoomScreen({Key? key}) : super(key: key);

  @override
  _RequestChangeRoomScreenState createState() =>
      _RequestChangeRoomScreenState();
}

class _RequestChangeRoomScreenState extends State<RequestChangeRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request for Change Room'),
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext) => ChangeRoomScreen()));
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
            top: kFlexibleSize(20)),
        child: Column(
          children: [
             RequestChangeRoomComponent(
              btncolor: Colors.green,
              btntext: 'Open',
            ),
            SizedBox(height: kFlexibleSize(10),),
            RequestChangeRoomComponent(
              btncolor: kRedColor,
              btntext: 'Close',
            )
          ],
        ),
      ),
    ));
  }
}
