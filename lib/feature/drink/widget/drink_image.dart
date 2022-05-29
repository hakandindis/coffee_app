part of 'drink_card.dart';

class _DrinkImage extends StatelessWidget {
  const _DrinkImage({
    Key? key,
    required this.model,
  }) : super(key: key);

  final DrinkModel model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(
            opacity: 0.5,
            fit: BoxFit.cover,
            image: AssetImage("assets/coffee/${model.imgName}.jpg"),
          ),
        ),
      ),
    );
  }
}
