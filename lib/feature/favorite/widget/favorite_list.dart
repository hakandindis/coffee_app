import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/app/model/drink_model.dart';
import 'package:coffee_app/feature/favorite/widget/favorite_card.dart';
import 'package:flutter/material.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({
    Key? key,
    required this.ref,
    required Stream<QuerySnapshot<Object?>> stream,
  })  : _stream = stream,
        super(key: key);

  final Stream<QuerySnapshot<Object?>> _stream;
  final CollectionReference ref;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: snapshot.data!.docs.map(
              (DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return FavoriteCard(
                  reference: ref,
                  model: DrinkModel.fromJson(data),
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
