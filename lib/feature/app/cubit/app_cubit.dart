import 'package:bloc/bloc.dart';
import 'package:coffee_app/feature/app/model/coffee_card_info.dart';
import 'package:coffee_app/feature/route/route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  List<CoffeeCardInfo> shoppingCartList = [];

  void addShoppingCartList(CoffeeCardInfo card) {
    shoppingCartList.add(card);
    emit(state.copyWith(coffeeCardCount: shoppingCartList.length));
  }

  void changePage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed(AppRoutes.homePage);
        emit(state.copyWith(currentPageIndex: index));
        break;
      case 1:
        Navigator.of(context).pushNamed(AppRoutes.shopPage);
        emit(state.copyWith(currentPageIndex: index));
        break;
    }
  }
}
