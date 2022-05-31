import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/app/cubit/app_cubit.dart';
import 'package:coffee_app/feature/app/model/drink_model.dart';
import 'package:coffee_app/product/padding/horizontal_padding.dart';
import 'package:coffee_app/product/padding/page_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCard extends StatelessWidget {
  const ShoppingCard({
    Key? key,
    required this.model,
    required this.reference,
  }) : super(key: key);

  final CollectionReference reference;
  final DrinkModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: const PagePadding.all(),
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: model.imgName != null
                        ? AssetImage("assets/coffee/${model.imgName}.jpg")
                        : AssetImage("assets/coffee/coffee1.jpg"),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: Padding(
                padding: const HorizontalPadding.symmetric(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.name ?? "Kahve",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 35),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          model.description ?? "",
                          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${model.price}",
                          style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        BlocListener<AppCubit, AppState>(
                          listener: (context, state) {},
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.orange),
                            onPressed: () {
                              reference.doc(model.id).update({"isAdd": false});
                              context.read<AppCubit>().removeDrinkFromShoppingList(model);
                            },
                            child: const Icon(Icons.delete_outline),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
