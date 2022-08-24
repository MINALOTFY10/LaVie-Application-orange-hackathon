import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/forum_model.dart';
import '../../../shared/components.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';
part 'forum_state.dart';

class ForumCubit extends Cubit<ForumState> {
  ForumCubit() : super(ForumInitialState());

  static ForumCubit get(context) => BlocProvider.of(context);
  List<ForumModel> forumList=[];
  List<Likes> likesList=[];
  List<Comments> commentsList=[];
  List<User> userList=[];
  List<int> commentsNumbers=[];
  List<int> likesNumbers=[];

  void getForumsData() {
    emit(ForumLoadingState());

    DioHelper.getData(
      url: forum,
      query: {},
    ).then((value) {
      // List<dynamic> list = value.data['data'];
      List<dynamic> list = value.data['data'];
      List<dynamic> commentList = value.data['data'];

      for(int i=0;i<list.length;i++) {
        forumList.add(ForumModel.fromJson(list[i]));
        likesList.add(Likes.fromJson(list[i]));
        commentsList.add(Comments.fromJson(list[i]));
        userList.add(User.fromJson(list[i]['user']));
        print('====================================');
        likesNumbers.add(list[i]['ForumLikes'].length);

        commentsNumbers.add(list[i]['ForumComments'].length);

        //print(commentsNumbers);
        // likesNumbers[i]=commentList[i]['ForumComments'].length;

        // print(commentList[i]['ForumLikes'].length);
        //print(commentList[i]['ForumComments'].length);

        //print(userList[i].imageUrl);
        print('====================================');
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

  int currentIndex = 0;


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
