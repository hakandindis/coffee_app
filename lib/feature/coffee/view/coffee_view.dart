// ignore_for_file: prefer_const_constructors

import 'package:coffee_app/feature/home/widget/header_text.dart';
import 'package:coffee_app/product/components/main_app_bar.dart';
import 'package:coffee_app/product/components/main_navigation_bar.dart';
import 'package:flutter/material.dart';

class CoffeeView extends StatefulWidget {
  const CoffeeView({Key? key}) : super(key: key);

  @override
  State<CoffeeView> createState() => _CoffeeViewState();
}

class _CoffeeViewState extends State<CoffeeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: const MainNavigationBar(),
      body: Column(
        children: const [
          HeaderText(),
        ],
      ),
    );
  }
}
