import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planetapp/models/product_model.dart';
import '../../../shared/components.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<ProductModel> product=[];

  void getProductData() {
    emit(HomeLoadingState());

    DioHelper.getData(
      url: PRODUCT,
      query: {},
    ).then((value) {

      List<dynamic> list = value.data['data'];

      //print(list[0]);
      for(int i=0;i<list.length;i++){
        print("1");
        product.add(ProductModel.fromJson(list[i]));
        // print("2");
        // print('==============================================================================');
        print(product[i].plant.name);
        // print('==============================================================================');
      }
      print("seed lenght is: ");
      print(product.length);

      emit(HomeSuccessState());
    }).catchError((error) {
      if(error is DioError){
        print(error.response);
      }else{

        print(error.toString());
      }
      emit(HomeErrorState());
    });
  }















Widget Screens (context,int index) {
  if(index == 0 ){
    return allProductBuilder(list: [],context: context);
  }
  else if(index == 1 ){
     return Icon(Icons.account_box_sharp);
  }
  else if(index == 2 ){
    return allProductBuilder(list: product,context: context);
  }
  else{
    return Icon(Icons.add_call);
  }
}

  void changePage(int index) {
    currentIndex = index;
    emit(HomeChangePageState());
  }

  Color firstPrimaryColor() {
    if (currentIndex == 0) {
      return Colors.transparent;
    } else {
      return Color.fromRGBO(248, 248, 248, 1);
    }
  }
  Color firstTextColor() {
    if (currentIndex == 0) {
      return const Color.fromRGBO(26, 188, 0, 1);
    } else {
      return const Color.fromRGBO(151, 151, 151, 1);
    }
  }
  Color firstBorderColor() {
    if (currentIndex == 0) {
      return Color.fromRGBO(26, 188, 0, 1);
    } else {
      return Colors.transparent;
    }
  }

  Color secondPrimaryColor() {
    if (currentIndex == 1) {
      return Colors.transparent;
    } else {
      return Color.fromRGBO(248, 248, 248, 1);
    }
  }
  Color secondTextColor() {
    if (currentIndex == 1) {
      return const Color.fromRGBO(26, 188, 0, 1);
    } else {
      return const Color.fromRGBO(151, 151, 151, 1);
    }
  }
  Color secondBorderColor() {
    if (currentIndex == 1) {
      return Color.fromRGBO(26, 188, 0, 1);
    } else {
      return Colors.transparent;
    }
  }

  Color thirdPrimaryColor() {
    if (currentIndex == 2) {
      return Colors.transparent;
    } else {
      return Color.fromRGBO(248, 248, 248, 1);
    }
  }
  Color thirdTextColor() {
    if (currentIndex == 2) {
      return const Color.fromRGBO(26, 188, 0, 1);
    } else {
      return const Color.fromRGBO(151, 151, 151, 1);
    }
  }
  Color thirdBorderColor() {
    if (currentIndex == 2) {
      return Color.fromRGBO(26, 188, 0, 1);
    } else {
      return Colors.transparent;
    }
  }

  Color fourthPrimaryColor() {
    if (currentIndex == 3) {
      return Colors.transparent;
    } else {
      return Color.fromRGBO(248, 248, 248, 1);
    }
  }
  Color fourthTextColor() {
    if (currentIndex == 3) {
      return const Color.fromRGBO(26, 188, 0, 1);
    } else {
      return const Color.fromRGBO(151, 151, 151, 1);
    }
  }
  Color fourthBorderColor() {
    if (currentIndex == 3) {
      return Color.fromRGBO(26, 188, 0, 1);
    } else {
      return Colors.transparent;
    }
  }
}
