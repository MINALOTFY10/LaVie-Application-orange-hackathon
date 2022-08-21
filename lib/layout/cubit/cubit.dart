import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planetapp/layout/cubit/states.dart';
import '../../modules/blog/blog_screen.dart';
import '../../modules/cart/cart_screen.dart';
import '../../modules/home/ex_home_screen.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/profile/profile_screen.dart';
import '../../modules/splashScreen.dart';


class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());


  static AppCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;

  List<Widget> bottomScreens = [
    const splashScreen(),
    CartScreen(),
    const HomeScreen(),
    BlogScreen(),
    const ProfileScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(AppBottomNavState());
  }

  // void createDatabase() {
  //   openDatabase(
  //     'todo75.db',
  //     version: 1,
  //     onCreate: (database, version) {
  //       print('database created');
  //       database
  //           .execute(
  //           'CREATE TABLE USER (id INTEGER PRIMARY KEY, username text, email text, password text, firstName text,lastName text, phoneNumber text,country text, state text,city text) ')
  //           .then((value) {
  //         print('table created');
  //       }).catchError((error) {
  //         print('Error When Creating Table ${error.toString()}');
  //       });
  //     },
  //     onOpen: (database) {
  //       getDataFromDatabase(database);
  //       print('database opened!!!!!!!!!!!!!!!!!');
  //     },
  //   ).then((value) {
  //     database = value;
  //     emit(AppCreateDatabaseState());
  //   });
  // }
  //
  // insertToDatabase({
  //   required String username,
  //   required String email,
  //   required String password,
  //   required String firstName,
  //   required String lastName,
  //   required String phoneNumber,
  //   required String country,
  //   required String state,
  //   required String city,
  // }) async {
  //   await database.transaction((txn) async {
  //     txn
  //         .rawInsert(
  //       'INSERT INTO USER(username, email, password, firstName, lastName, phoneNumber, country, state, city) VALUES("$username", "$email", "$password", "$firstName", "$lastName", "$phoneNumber", "$country", "$state", "$city")',
  //     )
  //         .then((value) {
  //       print('$value inserted successfully');
  //
  //       emit(AppInsertDatabaseState());
  //
  //       getDataFromDatabase(database);
  //     }).catchError((error) {
  //       print('Error When Inserting New Record ${error.toString()}');
  //     });
  //   });
  // }
  //
  // void getDataFromDatabase(database) {
  //   userListDB = [];
  //   emit(AppGetDatabaseLoadingState());
  //
  //   database.rawQuery('SELECT * FROM USER').then((value) {
  //     value.forEach((element) {
  //       userListDB.add(element);
  //     });
  //
  //     emit(AppGetDatabaseState());
  //   });
  // }
  //
  // void updateData({
  //   required String status,
  //   required int id,
  // }) async {
  //   database.rawUpdate(
  //     'UPDATE INFO SET status = ? WHERE id = ?',
  //     [status, id],
  //   ).then((value) {
  //     getDataFromDatabase(database);
  //     emit(AppUpdateDatabaseState());
  //   });
  // }
  //
  // void deleteData({
  //   required int id,
  // }) async {
  //   database.rawDelete('DELETE FROM INFO WHERE id = ?', [id]).then((value) {
  //     getDataFromDatabase(database);
  //     emit(AppDeleteDatabaseState());
  //   });
  // }

  //===============================================================================

 
}
