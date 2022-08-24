import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/forum_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../builder/forum_builder.dart';
part 'forum_state.dart';

class ForumCubit extends Cubit<ForumState> {
  ForumCubit() : super(ForumInitialState());

  static ForumCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<ForumModel> forumList=[];
  List<Likes> likesList=[];
  List<Comments> commentsList=[];
  List<User> userList=[];
  List<int> commentsNumbers=[];
  List<int> likesNumbers=[];

  void getForumsData(dynamic title) {
    emit(ForumLoadingState());

    DioHelper.getDataByTitle(
      url: forum,
      query: {'search' : title},
    ).then((value) {

      // List<dynamic> list = value.data['data'];
      List<dynamic> list = value.data['data'];
      print('**********************************');
      print(list);
      print('**********************************');
      List<dynamic> commentList = value.data['data'];

      for(int i=0;i<list.length;i++) {
        forumList.add(ForumModel.fromJson(list[i]));
        likesList.add(Likes.fromJson(list[i]));
        commentsList.add(Comments.fromJson(list[i]));
        userList.add(User.fromJson(list[i]['user']));

        likesNumbers.add(list[i]['ForumLikes'].length);
        commentsNumbers.add(list[i]['ForumComments'].length);

        //print(commentsNumbers);
        // likesNumbers[i]=commentList[i]['ForumComments'].length;
        print('=================================================');
        print(commentList[i]['ForumLikes'].length);
        print(commentList[i]['ForumComments'].length);
        print('=================================================');
      }
      emit(ForumSuccessState());
    }).catchError((error) {
      if(error is DioError){
        print(error.response);
      }else{
        print(error.toString());
      }
      emit(ForumErrorState());
    });
  }

  void createNewPost(String title, String description, String imageUrl) {
    emit(ForumLoadingState());

    DioHelper.postData(
      url: createForum,
      data: {"title": title, "description": description,"imageUrl": imageUrl},
    ).then((value) {

      emit(ForumSuccessState());
    }).catchError((error) {
      //print(message);
      print(error.toString());

      //SnackbarMessage(context, "${error.response.data['message']}",false);
      emit(ForumErrorState());
    });
  }


  Widget Screens (context,int index) {
    if(index == 0 ){
      return forumBuilder(forumList: forumList,likesList: likesNumbers,commentsList: commentsNumbers,userList: userList);
    }
    else {
      return forumBuilder(forumList: forumList,likesList: likesNumbers,commentsList: commentsNumbers,userList: userList);
    }
  }

  void changePage(int index) {
    currentIndex = index;
    emit(ForumChangePageState());
  }

  Color firstPrimaryColor() {
    if(currentIndex == 0){
      return const Color.fromRGBO(26, 188, 0, 1);
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
