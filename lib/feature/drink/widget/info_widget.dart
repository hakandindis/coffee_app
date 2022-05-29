part of 'drink_card.dart';

class _InfoWidget extends StatelessWidget {
  const _InfoWidget({
    Key? key,
    required this.model,
    required this.favoritesRef,
  }) : super(key: key);

  final DrinkModel model;
  final CollectionReference<Map<String, dynamic>> favoritesRef;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _NameAndDescriptionTexts(model: model),
          _PriceAndBuyWidget(model: model, favoritesRef: favoritesRef),
        ],
      ),
    );
  }
}
