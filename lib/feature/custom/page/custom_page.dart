import 'package:coffee_app/feature/custom/view/custom_view.dart';
import 'package:flutter/material.dart';

class CustomPage extends StatefulWidget {
  const CustomPage({Key? key}) : super(key: key);

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  @override
  Widget build(BuildContext context) {
    return const CustomView();
  }
}
