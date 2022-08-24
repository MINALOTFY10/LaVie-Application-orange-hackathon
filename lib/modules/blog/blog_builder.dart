import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planetapp/modules/blog/single_blog_sreen.dart';

import '../../models/plant_model.dart';
import '../../models/seed_model.dart';
import '../../models/tool_model.dart';
import 'cubit/blog_cubit.dart';

Widget plantBlogBuilder({required List<PlantModel> plantList,context}) {
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: ListView.separated(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => plantItemInBlog(
          plantList[index],
          context),
      itemCount: plantList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16,),
    ),
  );
}

Widget plantItemInBlog(PlantModel model, context) {
  return BlocConsumer<BlogCubit, BlogState>(

          listener: (context, state) {},
          builder: (context, state) {
            String constImage = 'https://lavie.orangedigitalcenteregypt.com/uploads/1b0f2343-0270-4d3d-ba83-2a772e115dc9.jpg';
            return InkWell(
              onTap: (){
                Navigator.push (
                  context,
                  MaterialPageRoute (
                    builder: (context) => SingleBlogScreen(context,model.imageUrl == "" ?
                    constImage : 'https://lavie.orangedigitalcenteregypt.com${model.imageUrl}'),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  child: Row(

                    children: [
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            height: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(model.imageUrl == "" ?
                              constImage : 'https://lavie.orangedigitalcenteregypt.com${model.imageUrl}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
SizedBox(width: 15,),
                      Expanded(
                        flex: 7,
                        child: Container(
                          height: 120.0,
                          child: Column(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10,),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: const Text("2 days ago",
                                          style: TextStyle(
                                              color: Color.fromRGBO(26, 188, 0, 1),
                                              fontSize: 15,fontWeight: FontWeight.w400)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Text(
                                          "${model.name}",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 8),
                                        child: Text(
                                          "${model.description}",
                                          style: TextStyle(
                                            height: 1,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(125, 123, 123, 0.78),),
                                          maxLines: 2,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
}

// Widget seedBlogBuilder({required List<SeedModel> seedList,context}) {
//   return MediaQuery.removePadding(
//     context: context,
//     removeTop: true,
//     child: ListView.separated(
//       scrollDirection: Axis.vertical,
//       physics: const BouncingScrollPhysics(),
//       itemBuilder: (context, index) => seedItemInBlog(seedList[index],context),
//       itemCount: seedList.length,
//       separatorBuilder: (context, index) => const SizedBox(height: 16,),
//     ),
//   );
// }
//
// Widget seedItemInBlog(SeedModel model, context) {
//   return BlocProvider(
//
//       create: (BuildContext context) => BlogCubit(),
//
//       child: BlocConsumer<BlogCubit, BlogState>(
//
//           listener: (context, state) {},
//           builder: (context, state) {
//             String constImage = 'https://lavie.orangedigitalcenteregypt.com/uploads/1b0f2343-0270-4d3d-ba83-2a772e115dc9.jpg';
//             return InkWell(
//               onTap: (){
//                 Navigator.push (
//                   context,
//                   MaterialPageRoute (
//                     builder: (context) => SingleBlogScreen(),
//                   ),
//                 );
//               },
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 elevation: 2,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 2, right: 2),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         flex: 6,
//                         child: Padding(
//                           padding: const EdgeInsets.all(12),
//                           child: Container(
//                             height: 150,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image.network(model.imageUrl == "" ?
//                               constImage : 'https://lavie.orangedigitalcenteregypt.com${model.imageUrl}',
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//
//                       Expanded(
//                         flex: 7,
//                         child: Container(
//                           height: 120.0,
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SizedBox(height: 10,),
//                                     Container(
//                                       alignment: Alignment.topLeft,
//                                       child: const Text("2 days ago",
//                                           style: TextStyle(
//                                               color: Color.fromRGBO(26, 188, 0, 1),
//                                               fontSize: 15,fontWeight: FontWeight.w400)),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Container(
//                                       alignment: Alignment.topLeft,
//                                       child: Padding(
//                                         padding: EdgeInsets.only(right: 5),
//                                         child: Text(
//                                           "${model.name}",
//                                           style: TextStyle(
//                                             fontSize: 17,
//                                             fontWeight: FontWeight.w700,
//                                             color: Colors.black,
//                                           ),
//                                           maxLines: 2,
//                                           overflow: TextOverflow.visible,
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Container(
//                                       alignment: Alignment.topLeft,
//                                       child: Padding(
//                                         padding: EdgeInsets.only(right: 8),
//                                         child: Text(
//                                           "${model.description}",
//                                           style: TextStyle(
//                                             height: 1.5,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                             color: Color.fromRGBO(125, 123, 123, 0.78),),
//                                           maxLines: 2,
//                                           overflow: TextOverflow.visible,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }));
// }
//
// Widget toolBlogBuilder({required List<ToolModel> toolList,context}) {
//   return MediaQuery.removePadding(
//     context: context,
//     removeTop: true,
//     child: ListView.separated(
//       scrollDirection: Axis.vertical,
//       physics: const BouncingScrollPhysics(),
//       itemBuilder: (context, index) => toolItemInBlog(toolList[index],context),
//       itemCount: toolList.length,
//       separatorBuilder: (context, index) => const SizedBox(height: 16,),
//     ),
//   );
// }
//
// Widget toolItemInBlog(ToolModel model, context) {
//   return BlocProvider(
//
//       create: (BuildContext context) => BlogCubit(),
//
//       child: BlocConsumer<BlogCubit, BlogState>(
//
//           listener: (context, state) {},
//           builder: (context, state) {
//             String constImage = 'https://lavie.orangedigitalcenteregypt.com/uploads/1b0f2343-0270-4d3d-ba83-2a772e115dc9.jpg';
//             return InkWell(
//               onTap: (){
//                 Navigator.push (
//                   context,
//                   MaterialPageRoute (
//                     builder: (context) => SingleBlogScreen(),
//                   ),
//                 );
//               },
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 elevation: 2,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 2, right: 2),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         flex: 6,
//                         child: Padding(
//                           padding: const EdgeInsets.all(12),
//                           child: Container(
//                             height: 150,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image.network(model.imageUrl == "" ?
//                               constImage : 'https://lavie.orangedigitalcenteregypt.com${model.imageUrl}',
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//
//                       Expanded(
//                         flex: 7,
//                         child: Container(
//                           height: 120.0,
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SizedBox(height: 10,),
//                                     Container(
//                                       alignment: Alignment.topLeft,
//                                       child: const Text("2 days ago",
//                                           style: TextStyle(
//                                               color: Color.fromRGBO(26, 188, 0, 1),
//                                               fontSize: 15,fontWeight: FontWeight.w400)),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Container(
//                                       alignment: Alignment.topLeft,
//                                       child: Padding(
//                                         padding: EdgeInsets.only(right: 5),
//                                         child: Text(
//                                           "${model.name}",
//                                           style: TextStyle(
//                                             fontSize: 17,
//                                             fontWeight: FontWeight.w700,
//                                             color: Colors.black,
//                                           ),
//                                           maxLines: 2,
//                                           overflow: TextOverflow.visible,
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Container(
//                                       alignment: Alignment.topLeft,
//                                       child: Padding(
//                                         padding: EdgeInsets.only(right: 8),
//                                         child: Text(
//                                           "${model.description}",
//                                           style: TextStyle(
//                                             height: 1.5,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                             color: Color.fromRGBO(125, 123, 123, 0.78),),
//                                           maxLines: 2,
//                                           overflow: TextOverflow.visible,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }));
// }