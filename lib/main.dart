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
import 'package:shared_preferences/shared_preferences.dart';
import 'layout/cubit/app_cubit.dart';
import 'layout/cubit/app_states.dart';
import 'layout/laVieApp/laVie_layout.dart';
import 'modules/Login/cubit/login_cubit.dart';
import 'modules/blog/cubit/blog_cubit.dart';
import 'modules/forum/create_post_screen.dart';
import 'modules/forum/cubit/forum_cubit.dart';
import 'modules/forum/forum_screen.dart';
import 'modules/home/cubit/home_cubit.dart';
import 'modules/home/ex_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  final Widget widget;

  print(token);
  final prefs = await SharedPreferences.getInstance();

  if(prefs.getString('loginToken') != null){
    token = prefs.getString('loginToken')!;
    print(token);
    widget = AppLayout();
  }else{
    widget =LoginScreen();
  }
  runApp(MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  var startWidget;

   MyApp({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BlogCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => AppCubit()
              ..createDatabase()..getUserData()
          ),
          BlocProvider(
            create: (BuildContext context) => ForumCubit()..getForumsData("test"),
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
                 home: startWidget,
              );
            }));
  }

}
