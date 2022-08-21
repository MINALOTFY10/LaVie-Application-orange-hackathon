import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../layout/cubit/cubit.dart';
import '../layout/cubit/states.dart';
import '../models/product_model.dart';
import '../models/seed_model.dart';
import '../modules/Login/login_screen.dart';
import '../modules/blog/cubit/blog_cubit.dart';
import '../modules/blog/single_blog_sreen.dart';
import '../modules/forum/cubit/forum_cubit.dart';

Widget defaultFormField({
  required TextEditingController controller,
  bool isPassword = false,
  required String? Function(String?)? validate,

}) =>
    TextFormField(
      controller: controller,

      obscureText: isPassword,

      validator: validate,
      decoration: InputDecoration(

        contentPadding:
        const EdgeInsets.fromLTRB(
            15, 0, 0, 0),
        focusColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(5),
          borderSide: const BorderSide(
              color: Color.fromRGBO(
                  147, 147, 147, 1),
              style: BorderStyle.solid),
        ),
        focusedBorder:
        OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(
              5.0),
          borderSide: const BorderSide(
              color: Color.fromRGBO(
                  147, 147, 147, 1),
              style: BorderStyle.solid),
        ),
      ),
    );



Widget defaultLoginButton({
  required String text,
  required Function function,

}) =>
    Container(
      width: double.infinity,
      height: 46,
      child: ElevatedButton(
        onPressed: function(),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(
              26, 188, 0, 1),
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(
                5.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 15,
              fontWeight:
              FontWeight.w500),
        ),
      ),
    );



void SnackbarMessage(context, String text,bool success) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text,style: TextStyle(fontSize: 18),),
    duration: const Duration(milliseconds: 4000),
    backgroundColor: success ?  Color.fromRGBO(26, 188, 0, 1) : Colors.red,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(bottom: 2,left: 2,right: 2),
  ));
}


Widget loginScreenWidget(loginKey,
    firstNameController,
    lastNameController,
    emailController,
    passwordController,
    confirmPasswordController,
    cubit,
    context){
  return Padding(
    padding:
    const EdgeInsets.only(left: 41, right: 41),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40,),
        Form(
          key: loginKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 93,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: const Text("First Name", style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1),fontSize: 14),),
                            ),
                          ),
                          const SizedBox(width: 17,),
                          Expanded(
                            child: Container(child: const Text("Last Name", style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1),fontSize: 14),)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7,),
                      Row(
                        children: [
                          Expanded(
                            child:  defaultFormField(
                                controller: firstNameController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                }),
                          ),
                          const SizedBox(width: 17,),
                          Expanded(
                            child:  defaultFormField(
                                controller: lastNameController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                const Text("E-mail", style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1), fontSize: 14),),
                const SizedBox(height: 7,),

                defaultFormField(
                    controller: emailController,
                    validate: (String? value) {
                      bool validEmail = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value.toString());
                      if (value!.isEmpty) {
                        return 'Please enter Your email';
                      } else if (!validEmail) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    }),

                const SizedBox(height: 25,),
                const Text("Password", style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1), fontSize: 14),),
                const SizedBox(height: 7,),

                defaultFormField(
                    controller: passwordController,
                    validate: (String? value) {
                      bool validPassword = RegExp(
                          r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,32}$")
                          .hasMatch(value.toString());
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else if (!validPassword) {
                        return "The password is too weak";
                      }
                      return null;
                    }),

                const SizedBox(height: 25,),
                const Text("Confirm Password", style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1), fontSize: 14),),
                const SizedBox(height: 7,),

                defaultFormField(
                    controller: confirmPasswordController,
                    validate: (String? value) {
                      bool validPassword = RegExp(
                          r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,32}$")
                          .hasMatch(value.toString());
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else if (!validPassword) {
                        return "The password is too weak";
                      }
                      return null;
                    }),

                const SizedBox(height: 35,),
                Container(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {

                      if (loginKey.currentState!.validate()) {
                        cubit.signUP(firstNameController.text, lastNameController.text, emailController.text, passwordController.text);
                      }
                      Navigator.push (
                        context,
                        MaterialPageRoute (
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: const Color.fromRGBO(26, 188, 0, 1),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),),
                    ),
                    child: const Text("Login",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight:
                          FontWeight.w500),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8),
                    child:
                    Row(children: const <Widget>[
                      Expanded(
                          child: Divider(
                            height: 55,
                            color: Color.fromRGBO(
                                151, 151, 151, 1),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 8, right: 8),
                        child: Text(
                          "or continue with",
                          style: TextStyle(
                              color: Color.fromRGBO(
                                  151, 151, 151, 1)),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                            height: 55,
                            color: Color.fromRGBO(
                                151, 151, 151, 1),
                          )),
                    ])),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Image.asset(
                            "assets/Google.png")),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Image.asset(
                            "assets/Facebook.png")),
                  ],
                ),

              ]),
        ),
      ],
    ),
  );
}

Widget myDivider() => const SizedBox(
  width: double.infinity,
  height: 10,
);


Widget allProductBuilder({required  List<ProductModel> list, required context}){
  return  Padding(
    padding: const EdgeInsets.only(left: 15,right: 15,),
    child: SizedBox(
      height: MediaQuery.of(context).size.height + 200,
      child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
           // removeBottom: true,
            child: GridView.builder(
                //shrinkWrap: true,
                scrollDirection: Axis.vertical,
                controller: new ScrollController(keepScrollOffset: false),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 6 / 10,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15),
                itemCount: list.length,
                itemBuilder: (BuildContext context, index) {
                  return builtProductItem(list[index], context);

                }),
          ),
    ),
      );
}

Widget builtProductItem(ProductModel model,context) {
  return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return  Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 3,
                        child: Container(color: Colors.transparent,)),
                    Expanded(
                      flex: 8,
                      child: Card(
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                         child: Column(
                           children: [
                             SizedBox(height: 20,),
                             Row(
                               children: [
                                 new Spacer(),
                                 Row(
                                   children: [
                                     Container(
                                         width: 18,
                                         height: 18,
                                         color: Color.fromRGBO(247, 246, 247, 1),
                                         child: Center(
                                           child: InkWell(
                                               onTap: (){},
                                               child: FaIcon(FontAwesomeIcons.minus,size: 15,color: Color.fromRGBO(151, 151, 151, 1)), ),
                                         )),
                                     const Padding(
                                       padding: EdgeInsets.only(left: 5,right: 5),
                                       child: Text('0'),
                                     ),
                                     Container(
                                       width: 18,
                                         height: 18,
                                         color: Color.fromRGBO(247, 246, 247, 1),
                                         child: Center(
                                           child: InkWell(
                                               onTap: (){},
                                               child: FaIcon(FontAwesomeIcons.plus,size: 15,color: Color.fromRGBO(151, 151, 151, 1),)),
                                         )),
                                   ],
                                 ),
                                 SizedBox(width: 15,)
                               ],
                             ),

                           ],
                         ),

                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                          alignment: Alignment.topLeft,
                          //child: Image.asset("assets/Background - 2022-08-09T145931 3.png")),
                          child: Image.asset(model.imageUrl)),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        alignment: Alignment.topLeft,
                          //child: Text("GARDENIA PLANT",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)),
                          child: Text(model.name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(model.description,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),)),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Container(
                        height: 35,
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: const Color.fromRGBO(26, 188, 0, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: const Text("ADD TO CART",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]);
      });
}


Widget cartBuilder({required List<Map> list, context}) {
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: ListView.separated(
      scrollDirection: Axis.vertical,

      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => itemInCart( context),
      itemCount: 10,
      separatorBuilder: (context, index) => myDivider(),
    ),
  );
}

Widget itemInCart( context) {
  return  Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 2, right: 2),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8,top: 13,bottom: 13,right: 10),
                      child: Container(
                        width: 140.0,
                        height: 130.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          image: const DecorationImage(
                            image: AssetImage('assets/Rectangle 15.png'),
                            alignment: Alignment.center,
                          ),
                         ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
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
                                  child: const Padding(
                                    padding: EdgeInsets.only(right: 40),
                                    child: Text(
                                      "Cactus plant",
                                      style: TextStyle(
                                        fontSize: 19,
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
                                      child: const Text("200 EGP",
                                          style: TextStyle(
                                              color: Color.fromRGBO(26, 188, 0, 1),
                                              fontSize: 16,fontWeight: FontWeight.w500)),
                                    ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      width: 65,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      color: Color.fromRGBO(248, 248, 248, 1),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Row(
                                              children: [
                                                Container(
                                                    width: 15,
                                                    height: 15,
                                                    color: Color.fromRGBO(247, 246, 247, 1),
                                                    child: Center(
                                                      child: InkWell(
                                                        onTap: (){},
                                                        child: FaIcon(FontAwesomeIcons.minus,size: 11, color: Color.fromRGBO(26, 188, 0, 1),), ),
                                                    )),
                                                const Padding(
                                                  padding: EdgeInsets.only(left: 8,right: 8),
                                                  child: Text('1',style: TextStyle(fontWeight: FontWeight.w700),),
                                                ),
                                                Container(
                                                    width: 15,
                                                    height: 15,
                                                    color: Color.fromRGBO(247, 246, 247, 1),
                                                    child: Center(
                                                      child: InkWell(
                                                          onTap: (){},
                                                          child: FaIcon(FontAwesomeIcons.plus,size: 11, color: Color.fromRGBO(26, 188, 0, 1),)),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      padding: const EdgeInsets.all(0),
                                        onPressed: (){},
                                        icon: FaIcon(FontAwesomeIcons.trash,color: Color.fromRGBO(26, 188, 0, 1),size: 20,), ),
                                    SizedBox(width: 2,),
                                  ],
                                )
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
        );
      }



Widget blogBuilder({required List<Map> list, context}) {
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: ListView.separated(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => itemInBlog( context),
      itemCount: 4,
      separatorBuilder: (context, index) => const SizedBox(height: 16,),
    ),
  );
}

Widget itemInBlog( context) {
  return BlocProvider(

      create: (BuildContext context) => BlogCubit(),
  child: BlocConsumer<BlogCubit, BlogState>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: (){
            Navigator.push (
              context,
              MaterialPageRoute (
                builder: (context) => SingleBlogScreen(),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8,top: 13,bottom: 13,right: 8),
                      child: Container(
                        width: 140.0,
                        height: 130.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          image: const DecorationImage(
                            image: AssetImage('assets/Rectangle 15.png'),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
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
                                  child: const Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Text(
                                      "5 Tips to treat plants",
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
                                  child: const Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: Text(

                                      "leaf, in botany, any usually leaf, in botany, any usually ",
                                      style: TextStyle(
                                        height: 1.5,
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
      }));
}


Widget forumBuilder({required List<Map> list}) {
  return ListView.separated(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => itemInForum( context),
      itemCount: 4,
      separatorBuilder: (context, index) => const SizedBox(height: 16,),
    );
}

Widget itemInForum( context) {
  return BlocProvider(
      create: (BuildContext context) => ForumCubit(),
      child: BlocConsumer<ForumCubit, ForumState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Card(
                elevation: 2,
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
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: CircleAvatar(
                                  radius: 24,
                                  backgroundImage: AssetImage("assets/Rectangle 1022.png"),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Mayar Mohamed",style: TextStyle(fontWeight: FontWeight.w800),),
                                    SizedBox(height: 2,),
                                    Text("a month ago",style: TextStyle(color:Color.fromRGBO(151, 151, 151, 0.84),fontWeight: FontWeight.w400,fontSize: 13))
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ),
                      SizedBox(height: 17,),
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text("How To treat plants",
                          style: TextStyle(
                              fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(26, 188, 0, 1),
                        ),
                        ),
                      ),
                      SizedBox(height: 8,),
                      const Padding(
                        padding: EdgeInsets.only(left: 15,right: 5),
                        child: Text("It is a long established fact that a reader will be distracted",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(143, 141, 141, 1),
                          ),
                        ),
                      ),
                       SizedBox(height: 18,),
                      Image.asset("assets/pexels-scott-webb-213727 1.png"),
                       ],
                  ),
                ),
              );
          }));
}