import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Login/login_screen.dart';
import 'cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HomeCubit()..getProductData(),
        child: BlocConsumer<HomeCubit, HomeState>(
        listener: (BuildContext context, HomeState state) {},
    builder: (BuildContext context, HomeState state) {
      HomeCubit cubit = HomeCubit.get(context);
      return Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 35,),
            Center(
              child: Image.asset("assets/Group 1000003302.png"),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: TextFormField(
                        readOnly: true,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        style: const TextStyle(fontSize: 18.0),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 3.0,
                                style: BorderStyle.solid),
                          ),
                          contentPadding: EdgeInsets.only(left: 16, right: 16),
                          focusColor: const Color.fromRGBO(151, 151, 151, 1),
                          prefixIcon: Icon(Icons.search_rounded,
                            color: Color.fromRGBO(151, 151, 151, 1),),

                          fillColor: const Color.fromRGBO(248, 248, 248, 1),
                          filled: true,
                          hintText: "Search",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(151, 151, 151, 1),
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Container(
                      height: 45,
                      width: 51,
                      decoration: BoxDecoration(color: const Color.fromRGBO(
                          26, 188, 0, 1), borderRadius: BorderRadius.circular(
                          10)),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.shopping_cart_outlined, color: Colors.white,),))
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 17),
                        child: Row(
                          children: [
                            Container(
                              child: ElevatedButton(
                                  onPressed: () {
                                    cubit.changePage(0);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    side: BorderSide(width: 2,
                                        color: cubit.firstBorderColor()),
                                    primary: cubit.firstPrimaryColor(),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text("All", style: TextStyle(
                                      color: cubit.firstTextColor()))),
                            ),
                            const SizedBox(width: 12,),
                            Container(
                              child: ElevatedButton(
                                  onPressed: () {
                                    cubit.changePage(1);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    side: BorderSide(width: 2,
                                        color: cubit.secondBorderColor()),
                                    primary: cubit.secondPrimaryColor(),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 7, right: 7),
                                    child: Text("Plants",
                                        style: TextStyle(
                                            color: cubit.secondTextColor())),
                                  )),
                            ),
                            const SizedBox(width: 12,),
                            Container(
                              child: ElevatedButton(
                                  onPressed: () {
                                    cubit.changePage(2);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    side: BorderSide(width: 2,
                                        color: cubit.thirdBorderColor()),
                                    primary: cubit.thirdPrimaryColor(),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 7, right: 7),
                                    child: Text("Seeds",
                                        style: TextStyle(
                                            color: cubit.thirdTextColor())),
                                  )),
                            ),
                            const SizedBox(width: 12,),
                            Container(
                              child: ElevatedButton(
                                  onPressed: () {
                                    cubit.changePage(3);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    side: BorderSide(width: 2,
                                        color: cubit.fourthBorderColor()),
                                    primary: cubit.fourthPrimaryColor(),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 7, right: 7),
                                    child: Text("Tools",
                                        style: TextStyle(
                                            color: cubit.fourthTextColor())),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      cubit.Screens(context, cubit.currentIndex),
                      // cubit.bottomScreens[cubit.currentIndex],
                    ]
                ),
              ),
            ),
          ],
        ),
      );
    }));}
}
