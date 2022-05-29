import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/custom/widget/custom_list.dart';
import 'package:coffee_app/feature/home/widget/header_text.dart';
import 'package:flutter/material.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({Key? key}) : super(key: key);

  @override
  State<ShoppingView> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {
  final Stream<QuerySnapshot> _favoriteStream =
      FirebaseFirestore.instance.collection("drinks").where("isAdd", isEqualTo: true).snapshots();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderText(),
        SizedBox(height: 10),
        CustomList(stream: _favoriteStream),
      ],
    );
  }
}
