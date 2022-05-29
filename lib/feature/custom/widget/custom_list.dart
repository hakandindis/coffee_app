import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/app/model/drink_model.dart';
import 'package:coffee_app/product/padding/horizontal_padding.dart';
import 'package:coffee_app/product/padding/page_padding.dart';
import 'package:coffee_app/product/utility/drink_model_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  const CustomList({
    Key? key,
    required Stream<QuerySnapshot<Object?>> stream,
  })  : _stream = stream,
        super(key: key);

  final Stream<QuerySnapshot<Object?>> _stream;

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

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  Widget favoriteIcon(bool isFavorite) {
    return isFavorite
        ? IconButton(
            onPressed: () {},
            // ignore: prefer_const_constructors
            icon: Icon(
              CupertinoIcons.heart_fill,
              color: Colors.orange,
              size: 30,
            ),
          )
        : IconButton(
            onPressed: () {},
            // ignore: prefer_const_constructors
            icon: Icon(
              CupertinoIcons.heart,
              color: Colors.orange,
              size: 30,
            ));
  }

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
                    image: AssetImage("assets/coffee/${model.imgName}.jpg"),
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
                        favoriteIcon(model.isFavorite ?? false),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.orange),
                          onPressed: () {},
                          child: const Icon(Icons.add),
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
