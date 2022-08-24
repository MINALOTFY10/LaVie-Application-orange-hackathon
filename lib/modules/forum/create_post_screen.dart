import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components.dart';
import 'cubit/forum_cubit.dart';

class CreatePostScreen extends StatelessWidget {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ForumCubit(),
        child: BlocConsumer<ForumCubit, ForumState>(
            listener: (BuildContext context, ForumState state) {},
            builder: (BuildContext context, ForumState state) {
              ForumCubit cubit = ForumCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_rounded,
                        size: 30, color: Color.fromRGBO(0, 0, 0, 1)),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Create New Post",
                        style: TextStyle(
                            fontSize: 22,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 40,
                      )
                    ],
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: SizedBox(
                          height: 100,
                          child: TextFormField(
                            controller: titleController,

                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter Your email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              focusColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(147, 147, 147, 1),
                                    style: BorderStyle.solid),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(147, 147, 147, 1),
                                    style: BorderStyle.solid),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Title",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(111, 111, 111, 1))),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: titleController,

                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter Your email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(147, 147, 147, 1),
                                style: BorderStyle.solid),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(147, 147, 147, 1),
                                style: BorderStyle.solid),
                          ),
                        ),
                      ),
                      SizedBox(height: 40,),
                      Text("Description",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(111, 111, 111, 1))),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: titleController,

                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter Your email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(147, 147, 147, 1),
                                style: BorderStyle.solid),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(147, 147, 147, 1),
                                style: BorderStyle.solid),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      defaultLoginButton( text: 'Post', function: (){}),
                    ],
                  ),
                ),
              );
            }));
  }
}
