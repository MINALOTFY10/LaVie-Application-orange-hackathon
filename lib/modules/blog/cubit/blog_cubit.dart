import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:planetapp/models/plant_model.dart';
import 'package:planetapp/models/seed_model.dart';
import 'package:planetapp/models/tool_model.dart';
import 'package:planetapp/shared/network/end_points.dart';

import '../../../shared/network/remote/dio_helper.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit() : super(BlogInitialState());

  static BlogCubit get(context) => BlocProvider.of(context);

  List<PlantModel> plantList=[];
  List<SeedModel> seedList=[];
  List<ToolModel> toolList=[];

  void getBlogData() {
    emit(BlogLoadingState());

    DioHelper.getData(
      url: '/api/v1/products/blogs',
      query: {},
    ).then((value) {print(value.data['data']);
      List<dynamic> list = value.data['data']['plants'];
      print('=================================');
      //print(list[0]);
      print('=================================');
      for(int i=0;i<list.length;i++){
        plantList.add(PlantModel.fromJson(list[i]));
      }
    List<dynamic> secList = value.data['data']['seeds'];
    for(int i=0;i<secList.length;i++){
      seedList.add(SeedModel.fromJson(secList[i]));
    }
    List<dynamic> thirdList = value.data['data']['tools'];
    for(int i=0;i<thirdList.length;i++){
      toolList.add(ToolModel.fromJson(thirdList[i]));
    }

      emit(BlogSuccessState());
    }).catchError((error) {
      if(error is DioError){
        print(error.response);
      }else{
        print(error.toString());
      }
      emit(BlogErrorState());
    });
  }


}
