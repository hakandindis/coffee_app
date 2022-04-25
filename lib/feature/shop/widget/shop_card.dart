import 'package:coffee_app/feature/app/model/coffee_card_info.dart';
import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({Key? key, required this.coffeeCardInfo}) : super(key: key);

  final CoffeeCardInfo coffeeCardInfo;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // color: Colors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset("assets/coffee/${coffeeCardInfo.imgName}.jpg"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(coffeeCardInfo.name ?? ""),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(coffeeCardInfo.description ?? ""),
        ),
        Text(
          "\$${coffeeCardInfo.price}",
          style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ],
    );
  }
}
