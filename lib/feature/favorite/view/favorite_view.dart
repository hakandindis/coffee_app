// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/favorite/widget/favorites_list.dart';
import 'package:coffee_app/feature/home/widget/header_text.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  FavoriteView({Key? key}) : super(key: key);
  final Stream<QuerySnapshot> _favoriteStream =
      FirebaseFirestore.instance.collection("coffees").where("price", isGreaterThan: 1).snapshots();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderText(),
        SizedBox(height: 10),
        FavoritesList(favoriteStream: _favoriteStream),
      ],
    );
  }
}
