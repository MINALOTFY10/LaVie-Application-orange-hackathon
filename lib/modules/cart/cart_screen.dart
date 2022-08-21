import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components.dart';


class CartScreen extends StatelessWidget {


  bool cond =false;
  @override
  Widget build(BuildContext context) {

    return ConditionalBuilder(
              condition: cond ==false,
              builder: (context) => Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading:  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.keyboard_backspace_outlined,size: 30,
                          color: Color.fromRGBO(0, 0, 0, 1)),
                    ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("My Cart",
                        style: TextStyle(
                          fontSize: 22,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.w700),),
                    SizedBox(width: 40,)
                    ],
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15,top: 5),
                      ),
                      Expanded(
                        child: cartBuilder(
                            context: context, list: []),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: const [
                          Text("Total",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.75),
                                fontWeight: FontWeight.w500,fontSize: 25),),
                          Spacer(),
                          Text("180,000 EGP",
                            style: TextStyle(
                                color: Color.fromRGBO(26, 188, 0, 1),
                                fontWeight: FontWeight.w700,fontSize: 22),),
                        ],
                      ),
                      const SizedBox(height: 25,),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(26, 188, 0, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),),
                          ),
                          child: const Text("Checkout",style: TextStyle(fontSize: 17),),
                        ),
                      ),
                      const SizedBox(height: 45,),
                    ],
                  ),
                ),
              ),
              fallback: ((context) => Scaffold(
                body: Padding(
                  padding: const EdgeInsets.only(top: 65, left: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20,top: 0),
                        child: Text("My Cart",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w700),),
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                      Center(child: Container(
                        width: 240,
                          height: 240,
                          child: Image.asset("assets/Frame.png",
                          fit: BoxFit.fill,
                          )

                      )),
                      const SizedBox(height: 30,),
                      const Center(
                        child: Text("Your cart is empty",
                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
                      ),
                      const SizedBox(height: 10,),
                      const Padding(
                        padding: EdgeInsets.only(left: 5,right: 5),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            "Sorry, the keyword you entered cannot be found, please check again or search with another keyword.",
                            style: TextStyle(fontSize:18,color: Color.fromRGBO(33, 33, 33, 0.61),height: 1.3,fontWeight: FontWeight.w400),),
                        ),
                      ),
                    ],
                  ),
                ),
              )));
        }
  }
