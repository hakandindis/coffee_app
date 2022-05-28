// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/drink/widget/drink_card_list.dart';
import 'package:coffee_app/feature/home/widget/header_text.dart';
import 'package:coffee_app/product/components/main_app_bar.dart';
import 'package:coffee_app/product/components/main_navigation_bar.dart';
import 'package:flutter/material.dart';

class DrinkView extends StatefulWidget {
  const DrinkView({Key? key}) : super(key: key);

  @override
  State<DrinkView> createState() => _DrinkViewState();
}

class _DrinkViewState extends State<DrinkView> {
  final Stream<QuerySnapshot> _drinkStream = FirebaseFirestore.instance.collection('coffees').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: const MainNavigationBar(),
      body: Column(
        children: [
          HeaderText(),
          DrinkCardList(drinkStream: _drinkStream),
        ],
      ),
    );
  }
}
