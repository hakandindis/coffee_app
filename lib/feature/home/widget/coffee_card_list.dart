import 'package:coffee_app/feature/app/model/coffee_card_info.dart';
import 'package:coffee_app/feature/home/widget/coffee_card.dart';
import 'package:coffee_app/product/mock/mock_coffee_card_list.dart';
import 'package:flutter/material.dart';

class CoffeeCardList extends StatelessWidget {
  const CoffeeCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: ListView.builder(
        itemCount: MockCoffeeInfoList.list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CoffeeCard(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.6,
            coffeeCardInfo: CoffeeCardInfo(
              name: MockCoffeeInfoList.list[index].name,
              description: MockCoffeeInfoList.list[index].description,
              imgName: MockCoffeeInfoList.list[index].imgName,
              price: MockCoffeeInfoList.list[index].price,
            ),
          );
        },
      ),
    );
  }
}
