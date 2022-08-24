import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/login_model.dart';
import '../../../shared/constant.dart';
import '../../../shared/network/remote/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool wrongSignUp = false;

  late Data data;
  late UserData userData;

  void signIn(String email, String password) {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: '/api/v1/auth/signin',
      //data: {"password": "minaMINA121\$", "email": "menlotfy6@gmail.com"},
      data: {"password": password, "email": email},
    ).then((value) async {
      data = Data.fromJson(value.data['data']);
      userData = UserData.fromJson(value.data['data']['user']);



      Fluttertoast.showToast(
          msg: "Logged in Successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );
      emit(LoginSuccessState());
    }).catchError((error) {

      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }


  void signUP(String firstName, String lastName, String email, String password) {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: '/api/v1/auth/signup',

      data: { "firstName": firstName, "lastName": lastName, "email": email, "password": password},
    ).then((value) {
      Fluttertoast.showToast(
          msg: "User Created Successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );
      emit(LoginSuccessState());
    }).catchError((error) {
      if(error is DioError){
        print(error.response);
        Fluttertoast.showToast(
            msg: "${error.response}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }else{
        print(error.toString());
      }
      emit(LoginErrorState(error.toString()));
    });
  }



}
