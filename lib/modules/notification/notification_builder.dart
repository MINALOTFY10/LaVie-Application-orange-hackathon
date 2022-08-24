import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget notificationBuilder({context}) {
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: ListView.separated(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => notification(
          context),
      itemCount: 8,
      separatorBuilder: (context, index) => const SizedBox(height: 0,),
    ),
  );
}

Widget notification( context) {
  return  Column(
    children: [
      Container(

          child: Padding(
            padding: const EdgeInsets.only(left: 2, right: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 15),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage:AssetImage("assets/Initials.png"),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Joy Arnold left 6 comments on Your Post",
                              style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text("Yesterday at 11:42 PM",
                                style: TextStyle(
                                    color: Color.fromRGBO(151, 151, 151, 0.84),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
      Divider(
        color: Color.fromRGBO(232, 235, 240, 1),
        height: 35,
        thickness: 2,
        indent: 0,
        endIndent: 0,
      )
    ],);

}
