import 'dart:async';
import 'package:flutter/material.dart';
import 'package:local/app/components/dailog_component.dart';
import 'package:local/app/providers/razorpay_provider.dart';
import 'package:local/app/views/common_images.dart';
import 'package:provider/provider.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;

  int currentSeconds = 0;

  double progressValue = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        progressValue = ((currentSeconds * 100) / timerMaxSeconds);
        print((currentSeconds * 100) / timerMaxSeconds);
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();

    scheduleTimeout(60 * 1000);

    Timer mytimer = Timer.periodic(Duration(seconds: 5), (timer) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        context.read<RazorPayProviderImpl>().transGetById();
      });
    });

    //mytimer.cancel(); //to end timer// 5 seconds.
  }

  void _showDialog({String? msg, Image? img, Color? colors}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DialogComponent(
          img: img,
          message: msg,
          color: colors,
        );
      },
    );
  }

  Timer scheduleTimeout([int milliseconds = 10000]) =>
      Timer(Duration(milliseconds: milliseconds), handleTimeout);

  void handleTimeout() {
    // callback function
    _showDialog(
        msg: 'Something Went Wrong', img: errorImg, colors: Colors.red[700]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment',
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: CircularProgressIndicator(
                          strokeWidth: 8,
                          value: 1 - (progressValue / 100.0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 2,
                    left: 2,
                    top: 5,
                    bottom: 2,
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Icon(Icons.timer),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            timerText,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
