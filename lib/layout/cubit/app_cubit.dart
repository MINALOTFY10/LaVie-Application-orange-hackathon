import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planetapp/layout/cubit/app_states.dart';
import 'package:planetapp/modules/forum/forum_screen.dart';
import 'package:planetapp/modules/notification/notification_screen.dart';
import 'package:planetapp/modules/qrScanner/qr_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/Cart_Model.dart';
import '../../models/product_model.dart';
import '../../modules/blog/blog_screen.dart';
import '../../modules/cart/cart_screen.dart';
import '../../modules/home/ex_home_screen.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/profile/profile_screen.dart';
import '../../modules/splashScreen.dart';
import '../../shared/components.dart';
import '../../shared/constant.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    ForumScreen(),
    QrScanner(),
    const HomeScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(AppBottomNavState());
  }

  List<ProductModel> cartListData = [];

  // int totalPrice = 0;
  // int totalItems = 0;
  int productQuantity = 1;

  int SearchInCartData(String id) {
    bool found = false;
    int end = cartDb.length;

    int i = 0;
    while (end > 0) {
      if (cartDb[i].id == id) {
        found = true;
        break;
      }
      i++;
      end--;
    }
    emit(SearchInCartDataSuccess());
    //print("postition: ");
    if (found) {
      // print(i);
      return i;
    } else {
      // print(-1);
      return -1;
    }
  }

  void AddToTotalItem(int? q) {
    totalItems += q!;
    emit(AddToTotalItemSuccess());
  }

  void RemoveFromTotalItem(int q) {
    totalItems -= q;
    emit(RemoveToTotalItemSuccess());
  }

  void AddToTotalPrice(int cost, int? q) {
    totalPrice = totalPrice + (cost * q!);
    emit(AddToTotalPriceSuccess());
  }

  void RemoveFromTotalPrice(int cost, int? q) {
    totalPrice = totalPrice - (cost * q!);
    emit(RemoveFromTotalPriceSuccess());
  }

  void AddProductInCart(dynamic model) {
    cartListData.add(model);
    emit(AddProductInCartSuccess());
  }

  void minusQuantityInCart(model) {
    if (model.quantity > 1) {
      model.quantity--;
      RemoveFromTotalPrice(model.price,1);
      RemoveFromTotalItem(1);
      emit(MinusQuantityInCartSuccess());
    }
  }
  void plusQuantityInCart(model) {
    if (model.quantity <= 60) {
      model.quantity++;
      AddToTotalPrice(model.price, 1);
      AddToTotalItem(1);
      emit(PlusQuantityInCartSuccess());
    }
  }

  void minusCounterInHome(model) {
    if (model.counter >= 1) {
      model.counter--;
      emit(MinusCounterInHomeSuccess());
    }
  }
  void plusCounterInHome(model) {
    if (model.quantity <= 60) {
      model.counter++;
      emit(PlusCounterInHomeSuccess());
    }
  }
  int totalItems =0;
  int totalPrice=0;

  int getTotalQuantity(){
    int total=0;
    for(int i=0;i<cartDb.length;i++){
      total = total + cartDb[i].quantity;
    }
    return total;
    //emit(GetTotalQuantityInCartSuccess());
  }
  int getTotalPrice(){
    int total=0;
    print(cartDb.length);
    for(int i=0;i<cartDb.length;i++){
      total=total+(cartDb[i].price * cartDb[i].quantity);
      print('===========================================');
      print(total);
      print('============================================');
    }
    return total;
    //emit(GetTotalPriceInCartSuccess());
  }


  static List<CartModel> cartDb = [];
  late Database database;

  void createDatabase() {
    openDatabase(
      'todo1012.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database
            .execute(
                'CREATE TABLE CART (id text, imageUrl text, name text, price int, quantity int) ')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print('database opened!!!!!!!!!!!!!!!!!');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatabase({
    required String id,
    required String imageUrl,
    required String name,
    required int price,
    required int? quantity,
  }) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO CART(id, imageUrl, name, price, quantity) VALUES("$id", "$imageUrl", "$name", "$price", "$quantity")',
      )
          .then((value) {
        print(
            '=====================================================================================================');
        print('$value inserted successfully');
        print(
            "$id is id, $imageUrl is imageUrl, $name is name, $price is price, $quantity is quantity");
        print(
            '=====================================================================================================');
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
      }).catchError((error) {
        print(
            '=====================================================================================================');
        print('Error When Inserting New Record ${error.toString()}');
      });
    });
  }

  void getDataFromDatabase(database) {
    cartDb = [];
    emit(AppGetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM CART').then((value) {
      // value.forEach((element) {
      //   cartDb.add(element);
      //  // print(cartDb[0].imageUrl);
      // });

      value.forEach((element) {
        cartDb.add(CartModel(
          price: element['price'] as int,
          id: element['id'] as String,
          imageUrl: element['imageUrl'] as String,
          name: element['name'] as String,
          quantity: element['quantity'] as int,
        ));
      });
      emit(AppGetDatabaseState());
    });
  }

  void updateData({
    required int quantity,
    required String id,
  }) async {
    database.rawUpdate(
      'UPDATE CART SET quantity = ? WHERE id = ?',
      [quantity, id],
    ).then((value) {
      print("=========================================");
      print(quantity);
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void deleteData({
    required String id,
  }) async {
    database.rawDelete('DELETE FROM CART WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  Future<void> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    firstName=prefs.getString('firstName')!;
    lastName=prefs.getString('lastName')!;
    imageUrl=prefs.getString('imageUrl')!;
    print(imageUrl);
  }
}
