import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planetapp/modules/Login/login_screen.dart';
import 'package:planetapp/modules/blog/blog_screen.dart';
import 'package:planetapp/modules/home/home_screen.dart';
import 'package:planetapp/modules/profile/profile_screen.dart';
import 'package:planetapp/shared/blocConsumer.dart';
import 'package:planetapp/shared/constant.dart';
import 'package:planetapp/shared/network/local/cache_helper.dart';
import 'package:planetapp/shared/network/remote/dio_helper.dart';
import 'layout/cubit/cubit.dart';
import 'layout/cubit/states.dart';
import 'layout/laVieApp/laVie_layout.dart';
import 'modules/Login/cubit/login_cubit.dart';
import 'modules/blog/cubit/blog_cubit.dart';
import 'modules/forum/create_post_screen.dart';
import 'modules/forum/cubit/forum_cubit.dart';
import 'modules/forum/forum_screen.dart';
import 'modules/home/cubit/home_cubit.dart';
import 'modules/home/ex_home_screen.dart';



void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();


  Widget widget;


  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  // token = CacheHelper.getData(key: 'token');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BlogCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => AppCubit()
              ..createDatabase()
          ),
          BlocProvider(
            create: (BuildContext context) => ForumCubit()
          ),
          BlocProvider(
              create: (BuildContext context) => HomeCubit()..getProductData()..getPlantData()..getSeedData()..getToolData(),
          ),
          BlocProvider(
              create: (BuildContext context) => LoginCubit()
          ),
        ],
        child: BlocConsumer<AppCubit, AppState>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: Colors.deepOrange,
                  scaffoldBackgroundColor: Colors.white,
                ),
                debugShowCheckedModeBanner: false,
                home: AppLayout(),
              );
            }));
  }

}