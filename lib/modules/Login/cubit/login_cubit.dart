import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../models/login_model.dart';
import '../../../shared/network/remote/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool wrongSignUp = false;

  late Data data;

  void signIn(String email, String password) {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: '/api/v1/auth/signin',
      //data: {"password": "minaMINA121\$", "email": "menlotfy6@gmail.com"},
      data: {"password": password, "email": email},
    ).then((value) {
      //print(value.data);
      print(value.data['data']['user']['email'].toString());
      print('==========================================');
      data = Data.fromJson(value.data['data']);

      print('==========================================');

      emit(LoginSuccessState());
    }).catchError((error) {
     // print(message);
      //print(error.toString());

      //SnackbarMessage(context, "${error.response.data['message']}",false);
      emit(LoginErrorState(error.toString()));
    });
  }


  void signUP(String firstName, String lastName, String email, String password) {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: '/api/v1/auth/signup',

      data: { "firstName": firstName, "lastName": lastName, "email": email, "password": password},
    ).then((value) {
      print(value.data);
      emit(LoginSuccessState());
    }).catchError((error) {

      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }



}
