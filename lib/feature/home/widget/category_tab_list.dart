import 'package:coffee_app/feature/home/widget/category_tab.dart';
import 'package:flutter/material.dart';

class CategoryTabList extends StatelessWidget {
  CategoryTabList({Key? key}) : super(key: key);

  final List<String> categoryNames = ["Ice", "Hot", "Milk", "Filter"];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: categoryNames.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryTab(categoryName: categoryNames[index]);
        },
      ),
    );
  }
}
