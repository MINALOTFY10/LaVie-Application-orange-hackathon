import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../shared/components.dart';
import 'create_post_screen.dart';
import 'cubit/forum_cubit.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ForumCubit()..getForumsData(),
        child: BlocConsumer<ForumCubit, ForumState>(
            listener: (BuildContext context, ForumState state) {},
            builder: (BuildContext context, ForumState state) {
             ForumCubit cubit = ForumCubit.get(context);
              return Scaffold(
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreatePostScreen()),
                      );
                    },
                    backgroundColor: Color.fromRGBO(26, 188, 0, 1),
                    child: FaIcon(FontAwesomeIcons.plus),
                  ),
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
                          "Discussion Forums",
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
                  body: Column(
                    children: [
                      const SizedBox(height: 15),
                      Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(children: [
                            Expanded(
                              child: SizedBox(
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () {},
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
                                    contentPadding:
                                        EdgeInsets.only(left: 16, right: 16),
                                    focusColor:
                                        const Color.fromRGBO(245, 245, 245, 1),
                                    prefixIcon: Icon(
                                      Icons.search_rounded,
                                      color: Color.fromRGBO(151, 151, 151, 1),
                                    ),
                                    fillColor:
                                        const Color.fromRGBO(248, 248, 248, 1),
                                    filled: true,
                                    hintText: "Search",
                                    hintStyle: TextStyle(
                                        color: Color.fromRGBO(151, 151, 151, 1),
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ])),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 17),
                        child: Row(
                          children: [
                            Container(
                              height: 28,
                              width: 125,
                              child: ElevatedButton(
                                  onPressed: () {
                                    cubit.changePage(0);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    side: BorderSide(width:1, color: cubit.firstBorderColor() ),
                                    primary: cubit.firstPrimaryColor(),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: Text("All Forums",style: TextStyle(color: cubit.firstTextColor()))),
                            ),
                            const SizedBox(width: 15,),
                            Container(
                              height: 28,
                              width: 125,
                              child: ElevatedButton(
                                  onPressed: () {
                                    cubit.changePage(1);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    side: BorderSide(width:1, color: cubit.secondBorderColor() ),
                                    primary: cubit.secondPrimaryColor(),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: Text("My Forums",
                                    style: TextStyle(color: cubit.secondTextColor()),)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(child: cubit.Screens(context, cubit.currentIndex)),
                    ],
                  ));
            }));
  }
}
