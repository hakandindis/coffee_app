import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/favorite/widget/favorites_list.dart';
import 'package:coffee_app/feature/home/widget/header_text.dart';
import 'package:flutter/material.dart';

class CustomView extends StatefulWidget {
  const CustomView({Key? key}) : super(key: key);

  @override
  State<CustomView> createState() => _CustomViewState();
}

class _CustomViewState extends State<CustomView> {
  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection("drinks").where("price", isGreaterThan: 2).snapshots();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderText(),
        const SizedBox(height: 10),
        FavoritesList(favoriteStream: _stream),
      ],
    );
  }
}
