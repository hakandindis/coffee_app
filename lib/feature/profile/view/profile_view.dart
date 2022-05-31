// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/profile/widget/order_list.dart';
import 'package:coffee_app/product/padding/horizontal_padding.dart';
import 'package:coffee_app/product/padding/page_padding.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  final CollectionReference reference = FirebaseFirestore.instance.collection("orders");
  final Stream<QuerySnapshot<Object?>> stream = FirebaseFirestore.instance.collection("orders").snapshots();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserSection(),
        OrderText(),
        OrderList(stream: stream),
      ],
    );
  }
}

class OrderText extends StatelessWidget {
  const OrderText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Order History",
      style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.orange),
    );
  }
}

class UserSection extends StatelessWidget {
  const UserSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            minRadius: 50,
            backgroundImage: AssetImage("assets/profile/profile_photo.jpg"),
          ),
          Padding(
            padding: HorizontalPadding.symmetric(),
            child: Text(
              "HAKAN DINDIŞ",
              style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
