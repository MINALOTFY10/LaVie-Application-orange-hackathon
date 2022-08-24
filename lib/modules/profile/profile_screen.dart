import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Login/cubit/login_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
        listener: (BuildContext context, LoginState state) {},
        builder: (BuildContext context, LoginState state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            body: Stack(children: [
              Column(children: [
                Stack(children: [
                  Container(
                    height: 290,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.dstATop),
                        image: AssetImage("assets/Rectangle 1022.png"),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 45,
                        ),
                         CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(
                              "${cubit.userData.imageUrl}"),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${cubit.userData.firstName} ${cubit.userData.lastName}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 28),
                        )
                      ],
                    ),
                  ),
                ]),
              ]),
              Column(
                children: [
                  Expanded(
                      flex: 7,
                      child: Container(
                        color: Colors.transparent,
                      )),
                  Expanded(
                    flex: 13,
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Container(
                                          height: 75,
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  243, 254, 241, 1),
                                              borderRadius: BorderRadius
                                                  .circular(10)
                                            //more than 50% of width makes circle
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Image.asset(
                                                    "assets/Group 1264.png"),
                                              ),
                                              Expanded(child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  "You have 30 points",
                                                  style: TextStyle(fontSize: 18,
                                                      fontWeight: FontWeight
                                                          .w600),),
                                              )),
                                            ],
                                          )),
                                      const SizedBox(height: 25,),
                                      Container(
                                          alignment: Alignment.topLeft,
                                          child: Text("Edit Profile",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 22),)),
                                      const SizedBox(height: 25,),
                                      Material(
                                        elevation: 1,
                                        color: Colors.white,
                                        //borderRadius: BorderRadius.circular(10),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          side: const BorderSide(
                                            color: Color.fromRGBO(
                                                0, 0, 0, 0.19),
                                            width: 1,
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              height: 75,
                                              child: Row(
                                                children: [
                                                  Expanded(child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 18),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            "assets/icon.png"),
                                                        SizedBox(width: 20,),
                                                        Text("Change Name",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight
                                                                  .w600),),
                                                        Spacer(),
                                                        Icon(Icons
                                                            .arrow_forward_rounded,
                                                          color: Color.fromRGBO(
                                                              29, 89, 44, 1),),
                                                        SizedBox(width: 20,)
                                                      ],
                                                    ),
                                                  )),
                                                ],
                                              )),
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Material(
                                        elevation: 1,
                                        color: Colors.white,
                                        //borderRadius: BorderRadius.circular(10),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          side: const BorderSide(
                                            color: Color.fromRGBO(
                                                0, 0, 0, 0.19),
                                            width: 1,
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              height: 75,
                                              child: Row(
                                                children: [
                                                  Expanded(child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 18),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            "assets/icon.png"),
                                                        SizedBox(width: 20,),
                                                        Text("Change Email",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight
                                                                  .w600),),
                                                        Spacer(),
                                                        Icon(Icons
                                                            .arrow_forward_rounded,
                                                          color: Color.fromRGBO(
                                                              29, 89, 44, 1),),
                                                        SizedBox(width: 20,)
                                                      ],
                                                    ),
                                                  )),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          );
        });
  }
}