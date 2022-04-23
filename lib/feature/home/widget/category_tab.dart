import 'package:coffee_app/product/padding/horizontal_padding.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({Key? key, required this.categoryName}) : super(key: key);

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const HorizontalPadding.symmetric(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            categoryName,
            style: const TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.02,
            width: MediaQuery.of(context).size.width * 0.02,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
          ),
        ],
      ),
    );
  }
}
