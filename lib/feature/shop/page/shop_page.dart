// ignore_for_file: prefer_const_constructors

import 'package:coffee_app/feature/shop/view/shop_view.dart';
import 'package:coffee_app/product/components/main_app_bar.dart';
import 'package:coffee_app/product/components/main_navigation_bar.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: ShopView(),
      bottomNavigationBar: MainNavigationBar(),
    );
  }
}
