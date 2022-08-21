import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components.dart';
part 'forum_state.dart';

class ForumCubit extends Cubit<ForumState> {
  ForumCubit() : super(ForumInitialState());

  static ForumCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;

  List<Widget> bottomScreens = [
    Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 15, right: 15, top: 10),
        child: forumBuilder(list: []),
      ),
    ),
    Icon(Icons.account_balance)
  ];

  void changePage(int index) {
    currentIndex = index;
    emit(ForumChangePageState());
  }


  Color firstPrimaryColor() {
    if(currentIndex == 0){
      return Color.fromRGBO(26, 188, 0, 1);
    }
    else{
      return Colors.white;
    }
  }
  Color firstTextColor() {
    if(currentIndex == 0 ){
      return Colors.white;
    }
    else{
      return const Color.fromRGBO(151, 151, 151, 1);
   }
  }
  Color firstBorderColor() {
    if(currentIndex == 0 ){
      return Colors.transparent;
    }
    else{
      return const Color.fromRGBO(0, 0, 0, 0.13);
    }
  }


  Color secondPrimaryColor() {
    if(currentIndex == 1){
      return Color.fromRGBO(26, 188, 0, 1);
    }
    else{
      return Colors.white;
    }
  }
  Color secondTextColor() {
    if(currentIndex == 1){
      return Colors.white;
    }
    else{
      return Color.fromRGBO(151, 151, 151, 1);
    }
  }
  Color secondBorderColor() {
    if(currentIndex == 1 ){
      return Colors.transparent;
    }
    else{
      return Color.fromRGBO(0, 0, 0, 0.13);
    }
  }
}
