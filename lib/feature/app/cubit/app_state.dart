part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({this.price = 0, this.currentPageIndex = 0});

  final int price;
  final int currentPageIndex;

  @override
  List<Object> get props => [price, currentPageIndex];

  AppState copyWith({
    int? price,
    int? currentPageIndex,
  }) {
    return AppState(
      price: price ?? this.price,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
    );
  }
}
