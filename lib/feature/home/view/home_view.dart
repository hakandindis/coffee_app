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
  final Stream<QuerySnapshot> _coffeeStream = FirebaseFirestore.instance.collection('coffees').snapshots();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: _buildBody(),
      bottomNavigationBar: MainNavigationBar(),
    );
  }

  Widget _buildBody() {
    return StreamBuilder<QuerySnapshot>(
      stream: _coffeeStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Column(
          children: [
            HeaderText(),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  return CoffeeCard(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.6,
                    coffeeCardInfo: CoffeeCardInfo(
                      name: data['name'],
                      description: data['description'],
                      imgName: MockCoffeeInfoList.list[2].imgName,
                      price: data['price'],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
