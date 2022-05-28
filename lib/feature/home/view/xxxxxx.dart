
/*
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/app/model/coffee_card_info.dart';
import 'package:coffee_app/feature/app/model/coffee_model.dart';
import 'package:coffee_app/feature/home/widget/coffee_card.dart';
import 'package:coffee_app/feature/home/widget/coffee_card_list.dart';
import 'package:coffee_app/feature/home/widget/header_text.dart';
import 'package:coffee_app/product/components/main_app_bar.dart';
import 'package:coffee_app/product/components/main_navigation_bar.dart';
import 'package:coffee_app/product/mock/mock_coffee_card_list.dart';
import 'package:coffee_app/product/padding/page_padding.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late FirebaseFirestore firestore;

  late List<Map<String, dynamic>> coffeeList = [];

  @override
  void initState() {
    super.initState();
    firestore = FirebaseFirestore.instance;
  }

  @override
  Widget build(BuildContext context) {
    getAllCoffee();
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
          //CoffeeCardList(),
          Expanded(
            flex: 10,
            child: ListView.builder(
              itemCount: coffeeList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CoffeeCard(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.6,
                  coffeeCardInfo: CoffeeCardInfo(
                    name: coffeeList[index]['name'],
                    description: coffeeList[index]['description'],
                    imgName: MockCoffeeInfoList.list[index].imgName,
                    price: coffeeList[index]['price'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future getAllCoffee() async {
    final snapshot = await firestore.collection("coffees").get();
    List<QueryDocumentSnapshot> docs = snapshot.docs;
    coffeeList = docs.map((QueryDocumentSnapshot document) {
      return document.data() as Map<String, dynamic>;
    }).toList();
  }
}


*/