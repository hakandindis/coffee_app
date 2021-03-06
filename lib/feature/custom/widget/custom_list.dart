import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/app/model/drink_model.dart';
import 'package:coffee_app/feature/custom/widget/custom_card.dart';
import 'package:coffee_app/product/utility/drink_model_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  const CustomList({
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
                return CustomCard(
                  reference: ref,
                  model: DrinkModel(
                    id: data[DrinkProperties.id.name],
                    name: data[DrinkProperties.name.name],
                    imgName: data[DrinkProperties.imgName.name],
                    description: data[DrinkProperties.description.name],
                    price: data[DrinkProperties.price.name],
                    isFavorite: data[DrinkProperties.isFavorite.name],
                    isAdd: data[DrinkProperties.isAdd.name],
                    category: data[DrinkProperties.category.name],
                  ),
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
