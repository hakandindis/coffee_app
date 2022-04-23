import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainAppBar extends AppBar {
  MainAppBar({
    Key? key,
  }) : super(
          key: key,
          leading: const Icon(CupertinoIcons.circle_grid_3x3_fill),
          actions: const [Icon(CupertinoIcons.profile_circled), SizedBox(width: 20)],
          title: const Text("Coffee App"),
        );
}
