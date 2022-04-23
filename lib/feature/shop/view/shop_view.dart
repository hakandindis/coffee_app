import 'package:coffee_app/feature/app/cubit/app_cubit.dart';
import 'package:coffee_app/feature/app/model/coffee_card_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        List<CoffeeCardInfo> shoppingCartList = context.read<AppCubit>().shoppingCartList;
        return Container(
          height: 400,
          child: ListView.builder(
            itemCount: context.read<AppCubit>().shoppingCartList.length,
            itemBuilder: (context, index) {
              final CoffeeCardInfo coffeeCardInfo = shoppingCartList[index];
              return ListTile(
                leading: Image.asset(
                  "assets/coffee/${coffeeCardInfo.imgName}.jpg",
                ),
                title: Text(coffeeCardInfo.name ?? ""),
                subtitle: Text(coffeeCardInfo.description ?? ""),
              );
            },
          ),
        );
      },
    );
  }
}
