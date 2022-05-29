import 'package:coffee_app/feature/shopping/view/shopping_view.dart';
import 'package:coffee_app/product/components/main_app_bar.dart';
import 'package:coffee_app/product/components/main_navigation_bar.dart';
import 'package:flutter/material.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: const MainNavigationBar(),
      body: const ShoppingView(),
    );
  }
}
