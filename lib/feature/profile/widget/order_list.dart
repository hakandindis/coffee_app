import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/profile/widget/order_card.dart';
import 'package:coffee_app/product/utility/order_model_enum.dart';
import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  const OrderList({
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
                List<dynamic> drinkNames = data[OrderProperties.drinkNames.name];
                return OrderCard(drinkNames: drinkNames, data: data);
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
