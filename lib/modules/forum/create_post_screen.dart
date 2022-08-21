import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/forum_cubit.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

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
                  ));
            }));
  }
}