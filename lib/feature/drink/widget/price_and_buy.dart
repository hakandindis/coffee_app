part of 'drink_card.dart';

class _PriceAndBuyWidget extends StatelessWidget {
  const _PriceAndBuyWidget({
    Key? key,
    required this.model,
    required this.favoritesRef,
  }) : super(key: key);

  final DrinkModel model;
  final CollectionReference<Map<String, dynamic>> favoritesRef;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
