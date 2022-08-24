import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/blog_cubit.dart';

class SingleBlogScreen extends StatelessWidget {
  const SingleBlogScreen({Key? key}) : super(key: key);
  // Model model;
  // var context;

  // built_SingleBlogScreen(
  //     {Key? key, required this.model, required this.context})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

        create: (BuildContext context) => BlogCubit()..getBlogData(),
    child: BlocConsumer<BlogCubit, BlogState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: SingleChildScrollView(
                child:  Column(
                    children: [
                      Stack(
                        children: [
                          Row(
                          children: const [
                            Expanded(
                              child: Image(
                                height: 280,
                                image: AssetImage('assets/Rectangle 155.png'),
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
        }));
  }
}


// class single_blog_Screen extends StatelessWidget {
//   // Model model;
//   // var context;
//   //
//   // built_single_blog_Screen(
//   //     {Key? key, required this.model, required this.context})
//   //     : super(key: key);
//
//   @override
//   State<built_single_blog_Screen> createState() =>
//       _built_single_blog_ScreenState();
// }
//
// class _built_single_blog_ScreenState
//     extends State<built_Detail_Product_Screen> {
//   int? dropdownValue = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     AppCubit cubit = AppCubit.get(context);
//     return BlocConsumer<AppCubit, AppStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return Scaffold(
//               bottomNavigationBar: BottomAppBar(
//                 elevation: 0,
//                 shape: CircularNotchedRectangle(),
//                 color: Colors.white,
//                 //elevation: 2,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 22, top: 15),
//                       child: Container(
//                         height: 50,
//                         width: 80,
//                         decoration: BoxDecoration(
//                             color: Color.fromRGBO(250, 80, 168, 200),
//                             borderRadius: BorderRadius.circular(15)),
//                         child: Center(
//                           child: DropdownButton<int>(
//                             underline: Container(
//                               color: Colors.transparent,
//                             ),
//                             value: dropdownValue,
//                             icon: const Icon(Icons.keyboard_arrow_down_rounded),
//                             elevation: 16,
//                             style: const TextStyle(
//                                 color: Colors.deepPurple,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w900),
//                             onChanged: (int? newValue) {
//                               setState(() {
//                                 cubit.productQuantity = newValue!;
//                                 dropdownValue = newValue;
//                               });
//                               print(dropdownValue);
//                             },
//                             items: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9]
//                                 .map<DropdownMenuItem<int>>((int value) {
//                               return DropdownMenuItem<int>(
//                                 value: value,
//                                 child: Text(value.toString()),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 8,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 22, top: 15),
//                       child: Container(
//                         height: 50,
//                         width: 240,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Model m = Model.fromModel(widget.model);
//                             int index = cubit.SearchInCartData(m.id);
//
//                             if (index != -1) {
//                               int? q = cubit.cartListData[index].quantity! +
//                                   cubit.productQuantity;
//
//                               cubit.cartListData[index].ChangeQuantity(q);
//                               SnackbarMessage(
//                                   context, "Product Added To The Cart");
//
//                               cubit.AddToTotalItem(cubit.productQuantity);
//                               cubit.AddToTotalPrice(
//                                   m.price + 0.0, cubit.productQuantity);
//                             } else {
//                               m.ChangeQuantity(cubit.productQuantity);
//                               cubit.AddProductInCart(m);
//                               SnackbarMessage(context, "Item Added");
//
//                               cubit.AddToTotalItem(cubit.productQuantity);
//                               cubit.AddToTotalPrice(
//                                   m.price + 0.0, cubit.productQuantity);
//                             }
//                           },
//                           style: ElevatedButton.styleFrom(
//                             primary: const Color.fromRGBO(136, 0, 136, 30),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(13.0),
//                             ),
//                           ),
//                           child: const Text("ADD TO CART"),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               body: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 25, right: 25),
//                   child: Column(
//                     children: [
//                       SizedBox(height: 40),
//                       Row(
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             icon: const Icon(Icons.arrow_back_ios,
//                                 size: 30,
//                                 color: Color.fromRGBO(136, 0, 136, 30)),
//                           ),
//                           new Spacer(),
//                           Padding(
//                             padding: EdgeInsets.only(right: 12),
//                             child: IconButton(
//                               color: Color.fromRGBO(136, 0, 136, 30),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => myCartScreen(),
//                                   ),
//                                 );
//                               },
//                               icon: const Icon(Icons.shopping_cart_outlined,
//                                   size: 30),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Image(
//                         height: 270,
//                         image: NetworkImage('${widget.model.image}'),
//                         fit: BoxFit.fill,
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Container(
//                         alignment: Alignment.topLeft,
//                         child: Row(
//                           children: [
//                             RatingBarIndicator(
//                               rating: widget.model.rate + 0.0,
//                               direction: Axis.horizontal,
//                               itemCount: 5,
//                               itemSize: 25.0,
//                               itemPadding:
//                               const EdgeInsets.symmetric(horizontal: 0.0),
//                               itemBuilder: (context, _) => const Icon(
//                                 Icons.star_rate_rounded,
//                                 color: Colors.amber,
//                               ),
//                             ),
//                             new Spacer(),
//                             Container(
//                               decoration: BoxDecoration(
//                                   color:
//                                   const Color.fromRGBO(250, 80, 168, 190),
//                                   borderRadius: BorderRadius.circular(5)),
//                               child: Center(
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(4),
//                                     child: Text("${widget.model.category}",
//                                         style: const TextStyle(
//                                             color: Color.fromRGBO(136, 0, 136, 30),
//                                             fontWeight: FontWeight.w800)),
//                                   )),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         alignment: Alignment.topLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.only(right: 70),
//                           child: Text(
//                             "${widget.model.title}",
//                             maxLines: 2,
//                             style: const TextStyle(
//                                 fontSize: 23,
//                                 fontWeight: FontWeight.w800,
//                                 color: Color.fromRGBO(136, 0, 136, 60)),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 12,
//                       ),
//                       Container(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           "\$${widget.model.price}",
//                           style: const TextStyle(
//                               color: Color.fromRGBO(250, 80, 168, 20),
//                               fontSize: 22,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 35,
//                       ),
//                       Container(
//                           alignment: Alignment.topLeft,
//                           child: const Text(
//                             "Description",
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 color: Color.fromRGBO(136, 0, 136, 90),
//                                 fontWeight: FontWeight.w800),
//                           )),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         textAlign: TextAlign.left,
//                         "${widget.model.description}",
//                         style: TextStyle(
//                             color: Colors.grey[500],
//                             fontSize: 14,
//                             height: 1.7,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Container(
//                           alignment: Alignment.topLeft,
//                           child: const Text(
//                             "Reviews",
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 color: Color.fromRGBO(136, 0, 136, 90),
//                                 fontWeight: FontWeight.w800),
//                           )),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             "${widget.model.rate}",
//                             style: const TextStyle(
//                                 fontSize: 50,
//                                 color: Color.fromRGBO(136, 0, 136, 40),
//                                 fontWeight: FontWeight.w800),
//                           )),
//                       const SizedBox(
//                         height: 0,
//                       ),
//                       Container(
//                         alignment: Alignment.topLeft,
//                         child: RatingBarIndicator(
//                           rating: widget.model.rate + 0.0,
//                           direction: Axis.horizontal,
//                           itemCount: 5,
//                           itemSize: 35,
//                           itemPadding:
//                           const EdgeInsets.symmetric(horizontal: 0.0),
//                           itemBuilder: (context, _) => const Icon(
//                             Icons.star_rate_rounded,
//                             color: Colors.amber,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Container(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             "${widget.model.countRate} Reviews",
//                             style: TextStyle(
//                                 fontSize: 15,
//                                 color: Colors.grey[600],
//                                 fontWeight: FontWeight.w400),
//                           )),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       SizedBox(
//                         height: 50,
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             primary: const Color.fromRGBO(136, 0, 136, 30),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(11.0),
//                             ),
//                           ),
//                           child: const Text("WRITE A REVIEWS"),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       const Text("reviewsssssssssssssssss"),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Container(
//                           alignment: Alignment.topLeft,
//                           child: const Text(
//                             "Related Products",
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 color: Color.fromRGBO(136, 0, 136, 90),
//                                 fontWeight: FontWeight.w800),
//                           )),
//                       // allProductHorizontalBuilder(
//                       //     list: widget.model, context: context),
//
//                       const SizedBox(
//                         height: 200,
//                       ),
//                     ],
//                   ),
//                 ),
//               ));
//         });
//   }
// }
