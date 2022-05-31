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
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Row(
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
    );
  }
}
