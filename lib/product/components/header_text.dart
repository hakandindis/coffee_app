import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Find The Best Coffee For You",
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
