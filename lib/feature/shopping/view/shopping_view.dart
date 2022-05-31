import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/home/widget/header_text.dart';
import 'package:coffee_app/feature/shopping/view/shopping_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({Key? key}) : super(key: key);

  @override
  State<ShoppingView> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {
  final ref = FirebaseFirestore.instance.collection("drinks");

  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection("drinks").where("isAdd", isEqualTo: true).snapshots();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderText(),
        const SizedBox(height: 10),
        ShoppingList(stream: _stream, ref: ref),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.orange),
                  onPressed: () {},
                  child: const Icon(CupertinoIcons.arrow_right),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
