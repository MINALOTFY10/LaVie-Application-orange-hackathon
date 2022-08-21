import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planetapp/modules/Login/login_screen.dart';
import 'package:planetapp/modules/home/home_screen.dart';
import 'package:planetapp/shared/blocConsumer.dart';
import 'package:planetapp/shared/constant.dart';
import 'package:planetapp/shared/network/local/cache_helper.dart';
import 'package:planetapp/shared/network/remote/dio_helper.dart';
import 'layout/cubit/cubit.dart';
import 'layout/cubit/states.dart';
import 'layout/laVieApp/laVie_layout.dart';
import 'modules/forum/create_post_screen.dart';
import 'modules/forum/forum_screen.dart';
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
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppState>(
            listener: (BuildContext context, AppState state) {},
            builder: (BuildContext context, AppState state) {
              AppCubit cubit = AppCubit.get(context);
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: Colors.deepOrange,
                  scaffoldBackgroundColor: Colors.white,
                ),
                debugShowCheckedModeBanner: false,
                home: HomeScreen(),
              );
            }));
  }

}