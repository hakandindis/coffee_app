// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/drink/widget/drink_card_list.dart';
import 'package:coffee_app/product/components/header_text.dart';
import 'package:coffee_app/product/components/main_app_bar.dart';
import 'package:coffee_app/product/components/main_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class DrinkView extends StatefulWidget {
  const DrinkView({Key? key}) : super(key: key);

  @override
  State<DrinkView> createState() => _DrinkViewState();
}

class _DrinkViewState extends State<DrinkView> with TickerProviderStateMixin {
  final Stream<QuerySnapshot> _stream1 =
      FirebaseFirestore.instance.collection('drinks').where("category", isEqualTo: "milkshake").snapshots();

  final Stream<QuerySnapshot> _stream2 =
      FirebaseFirestore.instance.collection('drinks').where("category", isEqualTo: "filtre").snapshots();
  final Stream<QuerySnapshot> _stream3 =
      FirebaseFirestore.instance.collection('drinks').where("category", isEqualTo: "latte").snapshots();

  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(length: 3, vsync: this);
    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: const MainNavigationBar(),
      body: Column(
        children: [
          HeaderText(),
          Expanded(
            flex: 3,
            child: TabBar(
              controller: controller,
              indicator: DotIndicator(
                color: Colors.orange,
                distanceFromCenter: 25,
                radius: 5,
                paintingStyle: PaintingStyle.fill,
              ),
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                Tab(text: "Milkshake"),
                Tab(text: "Filtre Kahve"),
                Tab(text: "Aromalı Kahve"),
              ],
            ),
          ),
          Expanded(
            flex: 17,
            child: TabBarView(
              controller: controller,
              children: [
                DrinkCardList(drinkStream: _stream1),
                DrinkCardList(drinkStream: _stream2),
                DrinkCardList(drinkStream: _stream3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
