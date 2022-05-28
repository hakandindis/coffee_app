import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/app/model/drink_model.dart';
import 'package:coffee_app/product/padding/page_padding.dart';
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
                    name: data['name'],
                    description: data['description'],
                    imgName: data['imgName'],
                    price: data['price'],
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
            Expanded(
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
            Padding(
              padding: const PagePadding.all(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        model.name ?? "",
                        style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Text(model.description ?? "", style: Theme.of(context).textTheme.subtitle2),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${model.price}",
                        style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.orange),
                        onPressed: () {
                          favoritesRef.add(model.toJson(model));
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
