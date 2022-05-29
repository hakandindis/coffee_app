import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coffee_app/feature/app/model/coffee_card_info.dart';
import 'package:coffee_app/feature/route/route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  List<CoffeeCardInfo> shoppingCartList = [];
  List<CoffeeCardInfo> favoriteCartList = [];
  int totalPrice = 0;

  void addShoppingCartList(CoffeeCardInfo card) {
    shoppingCartList.add(card);
    totalPrice += card.price ?? 0;
    emit(state.copyWith(coffeeCardCount: shoppingCartList.length));
  }

  void addFavoriteCartList(CoffeeCardInfo card) {
    favoriteCartList.add(card);
    inspect(favoriteCartList);
  }

  void changePage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed(AppRoutes.drinkPage);
        emit(state.copyWith(currentPageIndex: index));
        break;
      case 1:
        Navigator.of(context).pushNamed(AppRoutes.shoppingPage);
        emit(state.copyWith(currentPageIndex: index));
        break;
      case 2:
        Navigator.of(context).pushNamed(AppRoutes.favoritePage);
        emit(state.copyWith(currentPageIndex: index));
        break;
      case 3:
        Navigator.of(context).pushNamed(AppRoutes.profilePage);
        emit(state.copyWith(currentPageIndex: index));
        break;
    }
  }
}
