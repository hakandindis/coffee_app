import 'package:coffee_app/feature/app/model/coffee_card_info.dart';
import 'package:coffee_app/feature/home/widget/coffee_card.dart';
import 'package:flutter/material.dart';

class CoffeeCardList extends StatelessWidget {
  const CoffeeCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CoffeeCard(
            coffeeCardInfo: CoffeeCardInfo(
              name: "Mocha",
              description: "With Milk",
              imgName: "coffee2",
              price: 35,
            ),
          );
        },
      ),
    );
  }
}
