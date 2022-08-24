import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cubit/app_cubit.dart';
import '../cubit/app_states.dart';


class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: Material(
            elevation: 20,
            child: CurvedNavigationBar(
              height: 60,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
                buttonBackgroundColor:const Color.fromRGBO(26, 188, 0, 1),
              animationDuration: const Duration(milliseconds: 600),
              items:  const <Widget>[
                FaIcon(FontAwesomeIcons.plantWilt,  size: 25),
                Icon(Icons.qr_code_scanner, size: 25),
                Icon(Icons.home_outlined, size: 28),
                Icon(Icons.notifications_none, size: 28),
                Icon(Icons.person_outline, size: 28),
              ],
              onTap: (index) {
                cubit.changeBottom(index);
              },
            ),
          ),
        );
      },
    );
  }
}
