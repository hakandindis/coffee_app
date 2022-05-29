import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/app/model/drink_model.dart';
import 'package:coffee_app/feature/drink/widget/drink_card.dart';
import 'package:coffee_app/product/padding/page_padding.dart';
import 'package:coffee_app/product/utility/drink_model_enum.dart';
import 'package:flutter/material.dart';

class DrinkCardList extends StatelessWidget {
  const DrinkCardList({
    Key? key,
    required Stream<QuerySnapshot<Object?>> drinkStream,
  })  : _drinkStream = drinkStream,
        super(key: key);

  final Stream<QuerySnapshot<Object?>> _drinkStream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _drinkStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return Expanded(
          child: Padding(
            padding: const PagePadding.all(),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return DrinkCard(
                  model: DrinkModel(
                    id: data[DrinkProperties.id.name],
                    name: data[DrinkProperties.name.name],
                    description: data[DrinkProperties.description.name],
                    imgName: data[DrinkProperties.imgName.name],
                    price: data[DrinkProperties.price.name],
                    isFavorite: data[DrinkProperties.isFavorite.name] as bool,
                    isAdd: data[DrinkProperties.isAdd.name],
                    category: data[DrinkProperties.category.name],
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
