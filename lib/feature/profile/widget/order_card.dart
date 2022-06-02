import 'package:coffee_app/product/padding/page_padding.dart';
import 'package:coffee_app/product/utility/order_model_enum.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.drinkNames,
    required this.data,
  }) : super(key: key);

  final List drinkNames;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(color: Colors.grey[800], borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 7,
              child: Wrap(
                children: List.generate(
                  drinkNames.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${drinkNames[index]}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                "\$${data[OrderProperties.totalPrice.name]}",
                style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
