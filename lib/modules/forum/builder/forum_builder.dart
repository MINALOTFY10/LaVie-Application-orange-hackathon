import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/forum_model.dart';
import '../cubit/forum_cubit.dart';

Widget forumBuilder({required List<ForumModel> forumList,required List<int> likesList,required List<int> commentsList,required List<User> userList}) {
  return Padding(
    padding: const EdgeInsets.only(left: 22,right: 22,bottom: 10),
    child: ListView.separated(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => itemInForum(forumList[index],likesList[index],commentsList[index],userList[index], context),
      itemCount: forumList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 35,),
    ),
  );
}

Widget itemInForum(ForumModel forumModel,int likesModel,int commentsModel,User userModel, context) {
  return BlocProvider(
      create: (BuildContext context) => ForumCubit(),
      child: BlocConsumer<ForumCubit, ForumState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
                child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2, right: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 0,left: 15),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: CircleAvatar(
                                        radius: 24,
                                        backgroundImage: NetworkImage(userModel.imageUrl),
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    Padding(
                                      padding:  const EdgeInsets.only(top: 3),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${userModel.firstName} ${userModel.lastName}",style: TextStyle(fontWeight: FontWeight.w800),),
                                          const SizedBox(height: 2,),
                                          const Text("a month ago",style: TextStyle(color:Color.fromRGBO(151, 151, 151, 0.84),fontWeight: FontWeight.w400,fontSize: 13))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 17,),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(forumModel.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(26, 188, 0, 1),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8,),
                              Padding(
                                padding: const EdgeInsets.only(left: 15,right: 5),
                                child: Text(forumModel.description,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(143, 141, 141, 1),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18,),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Center(child: Image.network("https://lavie.orangedigitalcenteregypt.com${forumModel.imageUrl}")),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,top: 14),
                        child: Row(
                          children: [
                            Image.asset("assets/Group.png"),
                            SizedBox(width: 6,),
                            Text("${likesModel} Likes",style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6),fontWeight: FontWeight.w500),),
                            SizedBox(width: 65,),
                            Text("${commentsModel} Replies",style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6),fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),

                    ]));
          }));
}

