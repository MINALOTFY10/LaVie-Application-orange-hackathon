
import 'package:flutter/material.dart';

Widget SingleBlogScreen(context,String image){
  return Scaffold(
    body: SingleChildScrollView(
      child:  Column(
        children: [
          Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Image(
                        height: 280,
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35,left: 8),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.keyboard_backspace_outlined,size: 30,
                        color: Color.fromRGBO(0, 0, 0, 1)),
                  ),
                ),
              ]
          ),
          const SizedBox(
            height: 30,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20,right: 5),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Padding(
                padding: EdgeInsets.only(right: 70),
                child: Text(
                  "5 Simple Tips to treat plants",
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25,right: 25),
            child:  Text(
              textAlign: TextAlign.left,
              "leaf, in botany, any usually flattened green outgrowth from the stem of  leaf, in botany, any usually flattened green outgrowth from the stem of  leaf, in botany, any usually flattened green outgrowth from the stem of  leaf, in botany, any usually flattened green outgrowth from the stem of  leaf, in botany, any usually flattened green outgrowth from the stem of  leaf, in botany, any usually flattened green outgrowth from the stem of  leaf, in botany, any usually flattened green outgrowth from the stem of  leaf, in botany, any usually flattened green outgrowth from the stem of  leaf, in botany, any usually flattened green outgrowth from the stem of  leaf, in botany, any usually flattened green outgrowth from the stem of  vleaf, in botany, any usually flattened green outgrowth from the stem of  leaf, in botany, any usually flattened green outgrowth from the stem of  leaf, in botany, any usually flattened green outgrowth from the stem of  ",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                  height: 1.9,
                  fontWeight: FontWeight.w600),
            ),
          )],
      ),
    ),
  );
}