import 'package:bloc/bloc.dart';
import 'package:coffee_app/feature/app/model/coffee_card_info.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<CoffeeCardInfo> coffeeList = [];
  int selectedIndex = 0;

  Future<void> fetchAllData() async {
    emit(HomeWaiting());
    await Future.delayed(const Duration(seconds: 4));
    emit(HomeSuccess());
  }
}
