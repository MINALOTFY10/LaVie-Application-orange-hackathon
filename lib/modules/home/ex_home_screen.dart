// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../shared/components.dart';
// import '../Login/login_screen.dart';
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
//
//
//     late TabController _tabCntroller;
//
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   void initState() {
//     _tabController = TabController(length: 4, vsync: this);
//     _tabController.addListener(_handleTabSelection);
//     super.initState();
//   }
//
//   _handleTabSelection() {
//     if (_tabController.indexIsChanging) {
//       setState(() {});
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const SizedBox(height: 35,),
//           Center(
//             child: Image.asset("assets/Group 1000003302.png"),
//           ),
//           const SizedBox(height: 35,),
//           Padding(
//             padding: const EdgeInsets.only(left: 16,right: 16),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: SizedBox(
//                     child: TextFormField(
//                       readOnly: true,
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoginScreen()));
//                       },
//                       style: const TextStyle(fontSize: 18.0),
//                       decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(
//                             color: Colors.transparent,
//                             width: 2.0,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                           borderSide: const BorderSide(
//                               color: Colors.transparent,
//                               width: 3.0,
//                               style: BorderStyle.solid),
//                         ),
//                         contentPadding: EdgeInsets.only(left: 16,right: 16),
//                         focusColor: const Color.fromRGBO(151, 151, 151, 1),
//                         prefixIcon: Icon(Icons.search_rounded,color: Color.fromRGBO(151, 151, 151, 1),),
//
//                         fillColor:  const Color.fromRGBO(248, 248, 248, 1),
//                         filled: true,
//                         hintText: "Search",
//                         hintStyle:  TextStyle(color: Color.fromRGBO(151, 151, 151, 1),fontSize: 18),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 16,),
//                 Container(
//                   height: 45,
//                   width: 51,
//                     decoration: BoxDecoration(color: const Color.fromRGBO(26, 188, 0, 1), borderRadius: BorderRadius.circular(10)),
//                     child: InkWell(
//                       onTap: (){},
//                       child: const Icon(Icons.shopping_cart_outlined,color: Colors.white,),))
//               ],
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   const SizedBox(height: 20,),
//                   Padding(
//                     padding: const EdgeInsets.only(left:10,right:10),
//                     child: SizedBox(
//                       height: 40,
//                       child: TabBar(
//                         controller: _tabController,
//                           isScrollable: true,
//                           unselectedLabelColor: const Color.fromRGBO(151, 151, 151, 1),
//                           labelColor: const Color.fromRGBO(26, 188, 0, 1),
//                           labelPadding: const EdgeInsets.symmetric(horizontal:8),
//                           indicator: BoxDecoration(
//                             color: Colors.transparent,
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(
//                             width: 3,
//                             color: const Color.fromRGBO(26, 188, 0, 1),
//                           ),
//
//                         ),
//                           tabs: [
//                             Container(
//                                 width: 50,
//                                 decoration: BoxDecoration(color: _tabController.index == 0 ? Colors.transparent : Color.fromRGBO(248, 248, 248, 1),borderRadius: BorderRadius.circular(10)),
//                                   child: const Tab(child: Text("All", style: TextStyle(fontSize: 18,),))),
//                             Container(
//                                width: 80,
//                                 decoration: BoxDecoration(color: _tabController.index == 1 ? Colors.transparent : Color.fromRGBO(248, 248, 248, 1),borderRadius: BorderRadius.circular(10)),
//
//                                 child: const Tab(child: Text("Plants", style: TextStyle(fontSize: 18,),))),
//                             Container(
//                                 width: 80,
//                                 decoration: BoxDecoration(color: _tabController.index == 2 ? Colors.transparent : Color.fromRGBO(248, 248, 248, 1),borderRadius: BorderRadius.circular(10)),
//
//                                 child: const Tab(child: Text("Seeds", style: TextStyle(fontSize: 18,),))),
//                             Container(
//                                 width: 80,
//                                 decoration: BoxDecoration(color: _tabController.index == 3 ? Colors.transparent : Color.fromRGBO(248, 248, 248, 1),borderRadius: BorderRadius.circular(10)),
//
//                                 child: const Tab(child: Text("Tools", style: TextStyle(fontSize: 18,),))),
//                           ]),
//                     ),
//                   ),
//
//                     [
//                       allProductBuilder(list: [],context: context),
//                       Icon(Icons.access_alarms),
//                       Icon(Icons.account_balance_outlined),
//                       Icon(Icons.add_circle),
//
//                     ][_tabController.index],
//
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
