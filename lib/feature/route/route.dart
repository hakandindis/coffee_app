import 'package:coffee_app/feature/drink/page/drink_page.dart';
import 'package:coffee_app/feature/favorite/page/favorite_page.dart';
import 'package:coffee_app/feature/home/page/home_page.dart';
import 'package:coffee_app/feature/profile/page/profile_page.dart';
import 'package:coffee_app/feature/shopping/page/shopping_page.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String homePage = "/homePage";
  static const String drinkPage = "/drinkPage";
  static const String shoppingPage = "/shoppingPage";
  static const String favoritePage = "/favoritePage";
  static const String profilePage = "/profilePage";

  static Map<String, WidgetBuilder> route() {
    return {
      homePage: (context) => const HomePage(),
      shoppingPage: (context) => const ShoppingPage(),
      drinkPage: (context) => const DrinkPage(),
      favoritePage: (context) => const FavoritePage(),
      profilePage: (context) => const ProfilePage(),
    };
  }
}
