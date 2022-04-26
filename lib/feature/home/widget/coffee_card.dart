// ignore_for_file: prefer_const_constructors

import 'package:coffee_app/feature/app/cubit/app_cubit.dart';
import 'package:coffee_app/feature/app/model/coffee_card_info.dart';
import 'package:coffee_app/product/padding/page_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeCard extends StatefulWidget {
  const CoffeeCard({
    Key? key,
    required this.height,
    required this.width,
    required this.coffeeCardInfo,
  }) : super(key: key);

  final CoffeeCardInfo coffeeCardInfo;
  final double height;
  final double width;

  @override
  State<CoffeeCard> createState() => _CoffeeCardState();
}

class _CoffeeCardState extends State<CoffeeCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black38),
        child: Padding(
          padding: const PagePadding.all(),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset("assets/coffee/${widget.coffeeCardInfo.imgName}.jpg"),
                  ),
                  const Spacer(),
                  Text(widget.coffeeCardInfo.name ?? "", style: Theme.of(context).textTheme.headline6),
                  const Spacer(),
                  Text(widget.coffeeCardInfo.description ?? "", style: Theme.of(context).textTheme.subtitle2),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${widget.coffeeCardInfo.price}",
                        style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.orange),
                        onPressed: () {
                          context.read<AppCubit>().addShoppingCartList(widget.coffeeCardInfo);
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 0,
                child: InkWell(
                  onTap: () {
                    isFavorite = !isFavorite;
                    if (isFavorite) context.read<AppCubit>().addFavoriteCartList(widget.coffeeCardInfo);
                    setState(() {});
                  },
                  child: !isFavorite
                      ? Icon(CupertinoIcons.heart, size: 40, color: Colors.orange)
                      : Icon(CupertinoIcons.heart_fill, size: 40, color: Colors.orange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
