// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/profile/widget/order_list.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  final CollectionReference reference = FirebaseFirestore.instance.collection("orders");
  final Stream<QuerySnapshot<Object?>> stream = FirebaseFirestore.instance.collection("orders").snapshots();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              minRadius: 50,
              backgroundImage: AssetImage("assets/coffee/coffee4.jpg"),
            ),
            Column(
              children: [
                Text("HAKAN DINDIŞ"),
              ],
            ),
          ],
        ),
        Text(
          "Order History",
          style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.orange),
        ),
        OrderList(stream: stream),
      ],
    );
  }
}
