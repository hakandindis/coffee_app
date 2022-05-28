import 'package:coffee_app/feature/drink/page/drink_page.dart';
import 'package:coffee_app/feature/favorite/page/favorite_page.dart';
import 'package:coffee_app/feature/home/page/home_page.dart';
import 'package:coffee_app/feature/profile/page/profile_page.dart';
import 'package:coffee_app/feature/shop/page/shop_page.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String homePage = "/homePage";
  static const String drinkPage = "/drinkPage";
  static const String shopPage = "/shopPage";
  static const String favoritePage = "/favoritePage";
  static const String profilePage = "/profilePage";

  static Map<String, WidgetBuilder> route() {
    return {
      homePage: (context) => const HomePage(),
      drinkPage: (context) => const DrinkPage(),
      shopPage: (context) => const ShopPage(),
      favoritePage: (context) => const FavoritePage(),
      profilePage: (context) => const ProfilePage(),
    };
  }
}
