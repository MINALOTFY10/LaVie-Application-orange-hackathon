// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:planetapp/modules/cart/cart_screen.dart';
//
// import '../../shared/components.dart';
// import '../Login/login_screen.dart';
// import 'cubit/home_cubit.dart';
//
// class ExHomeScreen extends StatelessWidget {
//   const ExHomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (BuildContext context) => HomeCubit()
//           ..getProductData()
//           ..getPlantData()
//           ..getSeedData()
//           ..getToolData(),
//         child: BlocConsumer<HomeCubit, HomeState>(
//             listener: (BuildContext context, HomeState state) {},
//             builder: (BuildContext context, HomeState state) {
//               HomeCubit cubit = HomeCubit.get(context);
//               return DefaultTabController(
//                     length: 4,
//                     child: Scaffold(
//                       body: Column(
//                             children: [
//                               const SizedBox(height: 65,),
//                               Center(
//                                 child: Image.asset("assets/Group 1000003302.png"),
//                               ),
//                               const SizedBox(height: 30,),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 16, right: 16),
//                                 child: Row(
//                                   children: [
//                                     Expanded(
//                                       child: SizedBox(
//                                         child: TextFormField(
//                                           readOnly: true,
//                                           onTap: () {
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) => LoginScreen()));
//                                           },
//                                           style: const TextStyle(fontSize: 18.0),
//                                           decoration: InputDecoration(
//                                             enabledBorder: OutlineInputBorder(
//                                               borderRadius: BorderRadius.circular(10),
//                                               borderSide: const BorderSide(
//                                                 color: Colors.transparent,
//                                                 width: 2.0,
//                                               ),
//                                             ),
//                                             focusedBorder: OutlineInputBorder(
//                                               borderRadius: BorderRadius.circular(10.0),
//                                               borderSide: const BorderSide(
//                                                   color: Colors.transparent,
//                                                   width: 3.0,
//                                                   style: BorderStyle.solid),
//                                             ),
//                                             contentPadding: EdgeInsets.only(left: 16, right: 16),
//                                             focusColor: const Color.fromRGBO(151, 151, 151, 1),
//                                             prefixIcon: Icon(Icons.search_rounded,
//                                               color: Color.fromRGBO(151, 151, 151, 1),),
//
//                                             fillColor: const Color.fromRGBO(248, 248, 248, 1),
//                                             filled: true,
//                                             hintText: "Search",
//                                             hintStyle: TextStyle(
//                                                 color: Color.fromRGBO(151, 151, 151, 1),
//                                                 fontSize: 18),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(width: 16,),
//                                     Container(
//                                         height: 45,
//                                         width: 51,
//                                         decoration: BoxDecoration(color: const Color.fromRGBO(
//                                             26, 188, 0, 1), borderRadius: BorderRadius.circular(
//                                             10)),
//                                         child: InkWell(
//                                           onTap: () {
//                                             Navigator.push (
//                                               context,
//                                               MaterialPageRoute (
//                                                 builder: (context) => CartScreen(),
//                                               ),
//                                             );
//                                           },
//                                           child: const Icon(
//                                             Icons.shopping_cart_outlined, color: Colors.white,),))
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 20),
//                                 child: Container(
//                                   height: 40,
//                                   child: TabBar(
//                                     labelPadding: EdgeInsets.symmetric(horizontal: 0),
//                                     indicator: ShapeDecoration(
//                                       shape: RoundedRectangleBorder(
//                                           side: BorderSide(color: Color.fromRGBO(26, 188, 0, 1), width: 3),
//                                           borderRadius: BorderRadius.circular(10)),
//                                     ),
//                                     indicatorColor: Colors.yellowAccent,
//                                     indicatorSize: TabBarIndicatorSize.tab,
//                                     labelColor: Color.fromRGBO(26, 188, 0, 1),
//                                     unselectedLabelColor: Color.fromRGBO(151, 151, 151, 1),
//                                     labelStyle: const TextStyle(
//                                         fontSize: 19, fontWeight: FontWeight.w600),
//                                     tabs: const [
//                                       Tab(child: Text("All"),),
//                                       Tab(child: Text("Plants"),),
//                                       Tab(child: Text("Seeds"),),
//                                       Tab(child: Text("Tools"),)
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   child: TabBarView(children: [
//                                     allProductBuilder(list: cubit.productList,context: context),
//                                     allPlantBuilder(list: cubit.plantList, context: context),
//                                     allSeedBuilder(list: cubit.seedList, context: context, object: cubit.seedList[18]),
//                                     allToolBuilder(list: cubit.toolList,context: context,object: cubit.toolList[10]),
//                                 ])),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//             }));
//   }
// }
