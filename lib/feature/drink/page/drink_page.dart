import 'package:coffee_app/feature/drink/view/drink_view.dart';
import 'package:flutter/material.dart';

class DrinkPage extends StatefulWidget {
  const DrinkPage({Key? key}) : super(key: key);

  @override
  State<DrinkPage> createState() => _DrinkPageState();
}

class _DrinkPageState extends State<DrinkPage> {
  @override
  Widget build(BuildContext context) {
    return const DrinkView();
  }
}
