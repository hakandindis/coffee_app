import 'package:coffee_app/feature/home/page/home_page.dart';
import 'package:coffee_app/feature/shop/page/shop_page.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String homePage = "/homePage";
  static const String shopPage = "/shopPage";
  static const String favoritesPage = "/favoritesPage";
  static const String profilePage = "/profilePage";

  static Map<String, WidgetBuilder> route() {
    return {
      homePage: (context) => const HomePage(),
      shopPage: (context) => const ShopPage(),
    };
  }
}
