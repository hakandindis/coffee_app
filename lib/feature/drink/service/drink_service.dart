import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/feature/app/model/drink_model.dart';

class CoffeeService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final Stream<QuerySnapshot> drinkStream;

  CoffeeService() {
    drinkStream = firestore.collection("coffees").snapshots();
  }

  List<DrinkModel> getAllCoffees() {
    //List<DrinkModel> drinkList;

    //Default return value
    return [DrinkModel(name: "", description: "", imgName: "", price: 15)];
  }
}
