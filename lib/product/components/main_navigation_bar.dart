import 'package:badges/badges.dart';
import 'package:coffee_app/feature/app/cubit/app_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return BottomNavigationBar(
          onTap: (int index) {
            if (state.currentPageIndex != index) {
              context.read<AppCubit>().changePage(context, index);
            }
          },
          currentIndex: state.currentPageIndex,
          iconSize: 30,
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            const BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  int count = state.coffeeCardCount;
                  return Badge(
                    badgeColor: Colors.orange,
                    badgeContent: Text("$count"),
                    child: const Icon(CupertinoIcons.shopping_cart),
                  );
                },
              ),
              label: "Shop",
            ),
            const BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart_fill), label: "Profile"),
            const BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled), label: "Profile"),
          ],
        );
      },
    );
  }
}
