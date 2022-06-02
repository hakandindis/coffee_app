// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/favorite/widget/favorite_list.dart';
import 'package:coffee_app/product/components/header_text.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  FavoriteView({Key? key}) : super(key: key);

  final ref = FirebaseFirestore.instance.collection("drinks");
  final Stream<QuerySnapshot> _favoriteStream =
      FirebaseFirestore.instance.collection("drinks").where("isFavorite", isEqualTo: true).snapshots();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderText(),
        SizedBox(height: 10),
        FavoriteList(stream: _favoriteStream, ref: ref),
      ],
    );
  }
}
