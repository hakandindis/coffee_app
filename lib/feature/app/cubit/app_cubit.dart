import 'package:bloc/bloc.dart';
import 'package:coffee_app/feature/app/model/drink_model.dart';
import 'package:coffee_app/feature/route/route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  int totalPrice = 0;

  List<DrinkModel> shoppingList = [];
  List<DrinkModel> favoriteList = [];

  void addDrinkToShoppingList(DrinkModel model) {
    shoppingList.add(model);
    totalPrice += model.price ?? 0;

    emit(state.copyWith(price: totalPrice));
  }

  void updateTotalPrice(int value) {
    totalPrice = value;
    emit(state.copyWith(price: totalPrice));
  }

  void removeDrinkFromShoppingList(DrinkModel model) {
    shoppingList.removeWhere((element) => element.id == model.id);
    totalPrice -= model.price ?? 0;
    if (totalPrice < 0) {
      totalPrice = 0;
    }
    emit(state.copyWith(price: totalPrice));
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
