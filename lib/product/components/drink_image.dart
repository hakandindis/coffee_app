import 'package:flutter/cupertino.dart';

class DrinkImage extends Image {
  DrinkImage.asset({this.imgName}) : super.asset(imgName ?? "assets/coffee/coffee1.jpg");
  final String? imgName;
}
