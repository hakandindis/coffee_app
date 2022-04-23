import 'package:coffee_app/feature/app/cubit/app_cubit.dart';
import 'package:coffee_app/feature/app/model/coffee_card_info.dart';
import 'package:coffee_app/product/padding/page_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeCard extends StatelessWidget {
  const CoffeeCard({
    Key? key,
    required this.coffeeCardInfo,
  }) : super(key: key);

  final CoffeeCardInfo coffeeCardInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Container(
        width: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black38),
        child: Padding(
          padding: const PagePadding.all(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset("assets/coffee/${coffeeCardInfo.imgName}.jpg"),
              ),
              const Spacer(),
              Text(coffeeCardInfo.name ?? "", style: Theme.of(context).textTheme.headline6),
              const Spacer(),
              Text(coffeeCardInfo.description ?? "", style: Theme.of(context).textTheme.subtitle2),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${coffeeCardInfo.price}",
                    style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.orange),
                    onPressed: () {
                      context.read<AppCubit>().addShoppingCartList(coffeeCardInfo);
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
