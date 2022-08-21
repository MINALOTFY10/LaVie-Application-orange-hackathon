import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/components.dart';
import 'cubit/blog_cubit.dart';

class BlogScreen extends StatelessWidget {


  bool cond =false;
  @override
  Widget build(BuildContext context) {

    return BlocProvider(

        create: (BuildContext context) => BlogCubit(),
        child: BlocConsumer<BlogCubit, BlogState>(

            listener: (context, state) {},
            builder: (context, state) {
              BlogCubit cubit = BlogCubit.get(context);
              return Scaffold(
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
                          Text("Blogs",
                            style: TextStyle(
                                fontSize: 22,
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontWeight: FontWeight.w700),),
                          SizedBox(width: 40,)
                        ],
                      ),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: Column(
                        children: [
                          Expanded(
                            child: blogBuilder(
                                context: context, list: []),
                          ),
                        ],
                      ),
                    ),
                  );
            }));
  }
}
