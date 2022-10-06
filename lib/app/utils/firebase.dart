import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local/main.dart';

import '../screens/message/message_screen.dart';

class FirebaseConfig {
  static String FCMToken = "";
}

class FirebaseHandler extends StatefulWidget {
  final Widget child;

  FirebaseHandler({required this.child});

  @override
  State createState() => FirebaseHandlerState();
}

class FirebaseHandlerState extends State<FirebaseHandler> {
  late Widget child;

  @override
  void initState() {
    super.initState();
    child = widget.child;

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!${message.data}');
      handleMessage(message);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('A new onMessagelisten event was published!');
      print(message.data);
      // showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         title: Text("Notification"),
      //         content: Text(message.notification!.body!),
      //         actions: [
      //           TextButton(
      //             child: Text("Ok"),
      //             onPressed: () {
      //               Navigator.of(context).pop();
      //             },
      //           )
      //         ],
      //       );
      //     });



      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      final IOSInitializationSettings initializationSettingsIOS =
          IOSInitializationSettings(
              onDidReceiveLocalNotification: onDidReceiveLocalNotification);
      final InitializationSettings initializationSettings =
          InitializationSettings(
              android: initializationSettingsAndroid,
              iOS: initializationSettingsIOS);
      flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: selectNotification);

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              priority: Priority.high,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
      // if(Platform.isAndroid){
      //   if (message.notification != null) {
      //     showOverlayNotification((context) {
      //       return SafeArea(
      //         child: TextButton(
      //           onPressed: (){
      //             handleMessage(message);
      //             OverlaySupportEntry.of(context)!.dismiss();
      //           },
      //           child: Card(
      //             color: kWhiteColor,
      //             margin: const EdgeInsets.only(left: 10,right: 10,top: 5),
      //             child: Container(
      //               padding: EdgeInsets.all(10),
      //               child: Row(
      //                 mainAxisSize: MainAxisSize.min,
      //                 children: [
      //                   Expanded(
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.start,
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       mainAxisSize: MainAxisSize.min,
      //                       children: [
      //                         Text(message.notification?.title ?? '',style: TextStyle(color: kPrimaryColor, fontSize: 20),textAlign: TextAlign.start,maxLines: 1),
      //                         Text(message.notification?.body ?? '',style: TextStyle(color: kPrimaryColor,fontSize: 16),textAlign: TextAlign.start,maxLines: 2)
      //                       ],
      //                     ),
      //                   ),
      //                   Column(
      //                     mainAxisSize: MainAxisSize.min,
      //                     children: [
      //                       IconButton(onPressed: (){
      //                         OverlaySupportEntry.of(context)!.dismiss();
      //                       }, icon: Icon(Icons.close,color: Colors.black,size: 20,)),
      //                       Text('Open',style: TextStyle(color: Colors.black, fontSize: 14),),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       );
      //     }, duration: Duration(milliseconds: 4000));
      //   }
      // }
    });

    handleOutsideNotification();
    _requestPermissions();
  }

  Future handleOutsideNotification() async {
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null && message.data != null) {
        handleMessage(message);
      }
    });
  }

  void handleMessage(RemoteMessage message) {
    print('opened');
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => MessageToFrontDeskScreen()),
    );
    // if (message.data['notification']['data'] == 'messanging_type') {
    //    Navigator.pushNamed(context, '/secondPage');
    //}
  }

  void selectNotification(String? payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    }
    await Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => MessageToFrontDeskScreen()),
    );
  }

  void onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title ?? ''),
        content: Text(body!),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessageToFrontDeskScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void _requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
