// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:coffee_app/feature/home/widget/coffee_card_list.dart';
import 'package:coffee_app/feature/home/widget/header_text.dart';
import 'package:coffee_app/product/components/main_app_bar.dart';
import 'package:coffee_app/product/components/main_navigation_bar.dart';
import 'package:coffee_app/product/padding/page_padding.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: _buildBody(),
      bottomNavigationBar: MainNavigationBar(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const PagePadding.all(),
      child: Column(
        children: [
          HeaderText(),
          SizedBox(height: 10),
          //CategoryTabList(),
          CoffeeCardList(),
        ],
      ),
    );
  }
}
