// ignore_for_file: prefer_const_constructors

import 'package:coffee_app/feature/profile/view/profile_view.dart';
import 'package:coffee_app/product/components/main_app_bar.dart';
import 'package:coffee_app/product/components/main_navigation_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: MainNavigationBar(),
      body: ProfileView(),
    );
  }
}
