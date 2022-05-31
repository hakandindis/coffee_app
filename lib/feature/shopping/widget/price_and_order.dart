// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/app/cubit/app_cubit.dart';
import 'package:coffee_app/feature/app/model/drink_model.dart';
import 'package:coffee_app/feature/profile/model/order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceAndOrder extends StatelessWidget {
  PriceAndOrder({
    Key? key,
    required this.ref,
  }) : super(key: key);

  final CollectionReference ref;
  List<DrinkModel> drinkList = [];

  final CollectionReference orderRef = FirebaseFirestore.instance.collection("orders");

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        int totalPrice = state.price;
        return Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "\$$totalPrice",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 35, color: Colors.orange),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.orange),
                  onPressed: () {
                    drinkList = context.read<AppCubit>().shoppingList;
                    List<String> drinkNames = [];

                    for (var element in drinkList) {
                      ref.doc(element.id).update({"isAdd": false});
                      drinkNames.add(element.name ?? "");
                    }

                    OrderModel orderModel = OrderModel(drinkNames: drinkNames, totalPrice: totalPrice);
                    orderRef.add(orderModel.toJson(orderModel));

                    drinkNames.clear();
                    context.read<AppCubit>().shoppingList.clear();
                    context.read<AppCubit>().updateTotalPrice(0);
                  },
                  child: const Icon(CupertinoIcons.cart),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
