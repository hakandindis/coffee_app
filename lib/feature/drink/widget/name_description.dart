part of 'drink_card.dart';

class _NameAndDescriptionTexts extends StatelessWidget {
  const _NameAndDescriptionTexts({
    Key? key,
    required this.model,
  }) : super(key: key);

  final DrinkModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.name ?? "",
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
    );
  }
}
