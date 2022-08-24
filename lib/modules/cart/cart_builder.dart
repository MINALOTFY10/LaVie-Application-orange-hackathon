import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../layout/cubit/app_cubit.dart';
import '../../layout/cubit/app_states.dart';
import '../../models/Cart_Model.dart';
import '../../shared/components.dart';

Widget cartBuilder({required List<CartModel> list, context}) {
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: ListView.separated(
      scrollDirection: Axis.vertical,

      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => itemInCart(list[index], context),
      itemCount: list.length,
      separatorBuilder: (context, index) => myDivider(),
    ),
  );
}

Widget itemInCart(CartModel model,context) {
  AppCubit cubit = AppCubit.get(context);
  return BlocConsumer<AppCubit, AppState>(
      listener: (BuildContext context, AppState state) {},
      builder: (BuildContext context, AppState state) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 2, right: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,top: 13,bottom: 13,right: 10),
                    child: Container(
                      width: 140.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        image:  DecorationImage(
                          image: NetworkImage('https://lavie.orangedigitalcenteregypt.com${model.imageUrl}'),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Container(
                    height: 130.0,
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Container(
                                alignment: Alignment.topLeft,
                                child:  Padding(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Text(
                                    "${model.name}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text("${model.price} EGP",
                                    style: TextStyle(
                                        color: Color.fromRGBO(26, 188, 0, 1),
                                        fontSize: 17,fontWeight: FontWeight.w600)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    width: 65,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                      color: Color.fromRGBO(248, 248, 248, 1),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Row(
                                            children: [
                                              Container(
                                                  width: 15,
                                                  height: 15,
                                                  color: Color.fromRGBO(247, 246, 247, 1),
                                                  child: Center(
                                                    child: InkWell(
                                                      onTap: (){
                                                        cubit.minusQuantityInCart(model);

                                                        cubit.updateData(quantity: model.quantity, id:model.id );

                                                        },
                                                      child: FaIcon(FontAwesomeIcons.minus,size: 11, color: Color.fromRGBO(26, 188, 0, 1),), ),
                                                  )),
                                              Padding(
                                                padding: EdgeInsets.only(left: 8,right: 8),
                                                child: Text('${model.quantity}',style: TextStyle(fontWeight: FontWeight.w700),),
                                              ),
                                              Container(
                                                  width: 15,
                                                  height: 15,
                                                  color: Color.fromRGBO(247, 246, 247, 1),
                                                  child: Center(
                                                    child: InkWell(
                                                        onTap: (){
                                                          cubit.plusQuantityInCart(model);

                                                          cubit.updateData(quantity: model.quantity, id:model.id );
                                                        },
                                                        child: FaIcon(FontAwesomeIcons.plus,size: 11, color: Color.fromRGBO(26, 188, 0, 1),)),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: InkWell(
                                      onTap: (){
                                            cubit.deleteData(id: model.id);
                                            cubit.RemoveFromTotalItem(model.quantity);
                                            cubit.RemoveFromTotalPrice(model.price,model.quantity);
                                            SnackbarMessage(context, "Product is deleted",true);
                                      },
                                      child:  FaIcon(FontAwesomeIcons.trash,color: Color.fromRGBO(26, 188, 0, 1),size: 20,),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}