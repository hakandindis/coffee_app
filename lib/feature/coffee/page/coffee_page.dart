import 'package:coffee_app/feature/coffee/view/coffee_view.dart';
import 'package:flutter/material.dart';

class CoffeePage extends StatefulWidget {
  const CoffeePage({Key? key}) : super(key: key);

  @override
  State<CoffeePage> createState() => _CoffeePageState();
}

class _CoffeePageState extends State<CoffeePage> {
  @override
  Widget build(BuildContext context) {
    return CoffeeView();
  }
}
