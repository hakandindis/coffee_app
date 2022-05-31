import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/app/cubit/app_cubit.dart';
import 'package:coffee_app/feature/app/model/drink_model.dart';
import 'package:coffee_app/product/padding/page_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'drink_image.dart';
part 'info_widget.dart';
part 'price_and_buy.dart';
part 'name_description.dart';

class DrinkCard extends StatelessWidget {
  final CollectionReference<Map<String, dynamic>> favoritesRef = FirebaseFirestore.instance.collection("drinks");

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
            Positioned(
              top: 10,
              right: 20,
              child: InkWell(
                onTap: () async {
                  if (model.isFavorite ?? false) {
                    await favoritesRef.doc(model.id).update({"isFavorite": false});
                  } else {
                    await favoritesRef.doc(model.id).update({"isFavorite": true});
                  }
                },
                child: model.isFavorite ?? false
                    ? const Icon(
                        CupertinoIcons.heart_fill,
                        size: 40,
                      )
                    : const Icon(
                        CupertinoIcons.heart,
                        size: 40,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
