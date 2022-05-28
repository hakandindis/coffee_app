import 'package:coffee_app/feature/favorite/view/favorite_view.dart';
import 'package:coffee_app/product/components/main_app_bar.dart';
import 'package:coffee_app/product/components/main_navigation_bar.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: const MainNavigationBar(),
      body: FavoriteView(),
    );
  }
}
