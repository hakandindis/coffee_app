import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/app/model/drink_model.dart';
import 'package:coffee_app/product/padding/page_padding.dart';
import 'package:flutter/material.dart';

part 'drink_image.dart';
part 'info_widget.dart';
part 'price_and_buy.dart';
part 'name_description.dart';

class DrinkCard extends StatelessWidget {
  final CollectionReference<Map<String, dynamic>> favoritesRef = FirebaseFirestore.instance.collection("favorites");

  DrinkCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  final DrinkModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(50),
        ),
        height: MediaQuery.of(context).size.height * 0.6,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _DrinkImage(model: model),
            _InfoWidget(model: model, favoritesRef: favoritesRef),
          ],
        ),
      ),
    );
  }
}
