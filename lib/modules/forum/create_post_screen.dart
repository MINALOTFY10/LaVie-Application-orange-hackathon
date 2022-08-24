
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/components.dart';
import 'cubit/forum_cubit.dart';

class CreatePostScreen extends StatelessWidget {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  File? image;

  Future pickImage() async{
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;
    final imagePath = File(image.path);
        this.image= imagePath;
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ForumCubit(),
        child: BlocConsumer<ForumCubit, ForumState>(
            listener: (BuildContext context, ForumState state) {
            },
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
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                            (cubit.photoIndex==0) ?
                                 Center(
                                   child: InkWell(
                              onTap: (){
                                cubit.changePhotoIndex();
                                pickImage();
                                print(image.toString());
                                String convertedImage;
                                convertedImage = cubit.getBase64FormateFile(image.toString());

                                cubit.convertedPhoto(convertedImage);
                                },

                              child: Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 3,
                                        color: Color.fromRGBO(26, 188, 0, 1),
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Center(child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 35,),
                                        Icon(Icons.add,size:35,color: Color.fromRGBO(26, 188, 0, 1),),
                                        SizedBox(height: 20,),
                                        Text("Add Photo",style: TextStyle(fontSize: 18,color: Color.fromRGBO(26, 188, 0, 1)),),
                                      ],
                                    ))),
                            ),
                                 )
                                : Center(
                                  child: InkWell(
                              onTap: (){},
                              child: Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 3,
                                        color: Color.fromRGBO(26, 188, 0, 1),
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Center(child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 35,),
                                        Icon(Icons.add,size:35,color: Color.fromRGBO(26, 188, 0, 1),),
                                        SizedBox(height: 20,),
                                        Text("Add Photo",style: TextStyle(fontSize: 18,color: Color.fromRGBO(26, 188, 0, 1)),),
                                      ],
                                    ))),
                            ),
                                ),

                        SizedBox(
                          height: 30,
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
                              return 'Please enter a title';
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
                          controller: descriptionController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter a description';
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
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {

                                cubit.createNewPost(titleController.text, descriptionController.text, "data:image/png;base64,${cubit.photoBase64}");
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromRGBO(26, 188, 0, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0),
                                ),
                              ), child: Text('Post',style: TextStyle(fontSize: 20),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ));
            }));
  }
}
