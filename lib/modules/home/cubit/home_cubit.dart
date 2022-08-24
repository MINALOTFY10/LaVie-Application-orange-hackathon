import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planetapp/models/product_model.dart';
import '../../../models/plant_model.dart';
import '../../../models/seed_model.dart';
import '../../../models/tool_model.dart';
import '../../../shared/components.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../builders/all_plant_builder.dart';
import '../builders/all_product_builder.dart';
import '../builders/all_seed_builder.dart';
import '../builders/all_tool_builder.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<ProductModel> productList=[];
  List<PlantModel> plantList=[];
  List<SeedModel> seedList=[];
  List<ToolModel> toolList=[];

  void getProductData() {
    emit(HomeLoadingState());

    DioHelper.getData(
      url: product,
      query: {},
    ).then((value) {
      List<dynamic> list = value.data['data'];

      for(int i=0;i<list.length;i++){
        productList.add(ProductModel.fromJson(list[i]));
      }
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

  void getPlantData() {
    emit(HomeLoadingState());

    DioHelper.getData(
      url: plant,
      query: {},
    ).then((value) {
      List<dynamic> list = value.data['data'];

      for(int i=0;i<list.length;i++){
        plantList.add(PlantModel.fromJson(list[i]));
      }
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

  void getSeedData() {
    emit(HomeLoadingState());

    DioHelper.getData(
      url: seed,
      query: {},
    ).then((value) {
      List<dynamic> list = value.data['data'];
      print(list[0]);
      for(int i=0;i<list.length;i++){
        seedList.add(SeedModel.fromJson(list[i]));
      }
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

  void getToolData() {
    emit(HomeLoadingState());

    DioHelper.getData(
      url: tool,
      query: {},
    ).then((value) {
      List<dynamic> list = value.data['data'];

      for(int i=0;i<list.length;i++){
        toolList.add(ToolModel.fromJson(list[i]));
      }
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

//=======================================================================================================

Widget Screens (context,int index) {
  if(index == 0 ){
    return allProductBuilder(list: productList,context: context);
  }
  else if(index == 1 ){
    return allPlantBuilder(
        list: plantList,
        context: context);
  }
  else if(index == 2 ){
    return allSeedBuilder(list: seedList, context: context);
  }
  else{
    return allToolBuilder(list: toolList,context: context);
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
