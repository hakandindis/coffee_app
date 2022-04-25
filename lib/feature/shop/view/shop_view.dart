// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:coffee_app/feature/app/cubit/app_cubit.dart';
import 'package:coffee_app/feature/app/model/coffee_card_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        List<CoffeeCardInfo> shoppingCartList = context.read<AppCubit>().shoppingCartList;
        return Column(
          children: [
            Expanded(
              flex: 8,
              child: ListView.builder(
                itemCount: context.read<AppCubit>().shoppingCartList.length,
                itemBuilder: (context, index) {
                  final CoffeeCardInfo coffeeCardInfo = shoppingCartList[index];
                  return ListTile(
                    leading: Image.asset("assets/coffee/${coffeeCardInfo.imgName}.jpg"),
                    title: Text(coffeeCardInfo.name ?? ""),
                    subtitle: Text(coffeeCardInfo.description ?? ""),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "\$${context.read<AppCubit>().totalPrice}",
                      style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.orange),
                      onPressed: () {},
                      child: const Icon(CupertinoIcons.arrow_right),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
