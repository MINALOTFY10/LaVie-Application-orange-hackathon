import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notification_builder.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: 40,
      ),
      Container(
          alignment: Alignment.center,
          child: Text(
            "Notification",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          )),
      SizedBox(height: 10,),
          Expanded(child: notificationBuilder( context: context)),
    ]));
  }
}
