part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({this.coffeeCardCount = 0, this.currentPageIndex = 0});

  final int coffeeCardCount;
  final int currentPageIndex;

  @override
  List<Object> get props => [coffeeCardCount, currentPageIndex];

  AppState copyWith({
    int? coffeeCardCount,
    int? currentPageIndex,
  }) {
    return AppState(
      coffeeCardCount: coffeeCardCount ?? this.coffeeCardCount,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
    );
  }
}
