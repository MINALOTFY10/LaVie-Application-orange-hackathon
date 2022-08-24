import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../layout/cubit/app_cubit.dart';
import '../../../layout/cubit/app_states.dart';
import '../../../models/product_model.dart';
import '../../../shared/components.dart';

Widget allProductBuilder({required  List<ProductModel> list, required context}){
  return  Padding(
    padding: const EdgeInsets.only(left: 15,right: 15,),
    child: SizedBox(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.builder(
          //shrinkWrap: true,
            scrollDirection: Axis.vertical,
            controller: new ScrollController(keepScrollOffset: false),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 7 / 11,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: list.length,
            itemBuilder: (BuildContext context, index) {
              return builtProductItem(list[index], context);

            }),
      ),
    ),
  );
}

Widget builtProductItem(ProductModel model,context) {
  AppCubit cubit = AppCubit.get(context);
  return BlocConsumer<AppCubit, AppState>(
      listener: (BuildContext context, AppState state) {},
      builder: (BuildContext context, AppState state) {
        AppCubit cubit = AppCubit.get(context);
        dynamic modelType;
        if(model.type == "PLANT"){
          modelType =model.plant;
        }else if(model.type == "SEED"){
          modelType =model.seed;
        }else if(model.type == "TOOL"){
          modelType =model.tool;
        }
        return Card(
            elevation: 4,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Expanded(
                        flex: 6,
                        child: Image.network('https://lavie.orangedigitalcenteregypt.com${model.imageUrl}')),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                                alignment: Alignment.topLeft,
                                child: Text(modelType.name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),)),

                          ),
                          const SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text("${model.price} EGP",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),)),
                                new Spacer(),
                                Container(
                                    width: 18,
                                    height: 18,
                                    color: Color.fromRGBO(247, 246, 247, 1),
                                    child: Center(
                                      child: InkWell(
                                        onTap: (){
                                          cubit.minusCounterInHome(model);
                                          cubit.productQuantity= model.counter!;
                                        },
                                        child: FaIcon(FontAwesomeIcons.minus,size: 15,color: Color.fromRGBO(151, 151, 151, 1)), ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 7,right: 7),
                                  child: Text('${model.counter}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                      width: 18,
                                      height: 18,
                                      color: Color.fromRGBO(247, 246, 247, 1),
                                      child: Center(
                                        child: InkWell(
                                            onTap: (){
                                              cubit.plusCounterInHome(model);
                                              cubit.productQuantity= model.counter!;
                                            },
                                            child: FaIcon(FontAwesomeIcons.plus,size: 15,color: Color.fromRGBO(151, 151, 151, 1),)),
                                      )),
                                ),

                              ],
                            ),
                          ),
                          new Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Container(
                              height: 35,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        ProductModel m = ProductModel.fromProductModel(model);
                                        int index = cubit.SearchInCartData(m.productId);

                                        if (index != -1) {        //if item founded in cart
                                          int? q = AppCubit.cartDb[index].quantity +
                                              cubit.productQuantity;

                                          cubit.updateData(quantity: q, id: model.productId);

                                          AppCubit.cartDb[index].ChangeQuantity(q);
                                          SnackbarMessage(context, "Added To The Cart",true);
                                          cubit.AddToTotalItem(cubit.productQuantity);
                                          cubit.AddToTotalPrice(m.price, cubit.productQuantity);

                                        } else {   //if item not founded in cart

                                          //m.ChangeQuantity(cubit.productQuantity);
                                          m.ChangeQuantity(model.counter);

                                          cubit.insertToDatabase(id: model.productId, imageUrl: model.imageUrl, name: model.name, price: model.price, quantity: model.counter);

                                          cubit.AddProductInCart(m);
                                          SnackbarMessage(context, "Added To The Cart",true);
                                          cubit.AddToTotalItem(cubit.productQuantity);
                                          cubit.AddToTotalPrice(
                                              m.price , cubit.productQuantity);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color.fromRGBO(26, 188, 0, 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      child: const Text("ADD TO CART",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),

                  ],
                )
            ));
      });
}