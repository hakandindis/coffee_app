// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_app/product/padding/page_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active_outlined), label: ""),
        ],
      ),
      body: Padding(
        padding: const PagePadding.all(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Find The Best Coffee For You", style: Theme.of(context).textTheme.headlineMedium),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                prefixIcon: const Icon(Icons.search_outlined),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const PagePadding.all(),
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black38,
                      ),
                      child: Padding(
                        padding: const PagePadding.all(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset("assets/coffee/coffee1.jpg"),
                            ),
                            Spacer(),
                            Text("Cappuccino", style: Theme.of(context).textTheme.headline6),
                            Spacer(),
                            Text("With Oat Milk", style: Theme.of(context).textTheme.subtitle2),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: const Icon(CupertinoIcons.circle_grid_3x3_fill),
      actions: const [Icon(CupertinoIcons.person_crop_rectangle)],
      title: const Text("Coffee"),
    );
  }
}
