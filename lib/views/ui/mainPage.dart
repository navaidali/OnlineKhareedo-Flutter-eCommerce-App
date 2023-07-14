import 'package:flutter/material.dart';
import 'package:online_khareedo/controllers/mainscreen_provider.dart';
import 'package:online_khareedo/views/shared/bottom_nav.dart';
import 'package:online_khareedo/views/ui/cartPage.dart';
import 'package:online_khareedo/views/ui/homePage.dart';
import 'package:online_khareedo/views/ui/product_by_cart.dart';
import 'package:online_khareedo/views/ui/profile.dart';
import 'package:online_khareedo/views/ui/searchPage.dart';
import 'package:provider/provider.dart';

import '../shared/bottomNavWidget.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  List<Widget> pageList = [
    HomePage(),
    SearchPage(),
    HomePage(),
    CartPage(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(builder: (context, mainScreenNotifier, child){
      return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: pageList[mainScreenNotifier.pageIndex],
        bottomNavigationBar: const BottomNavBar(),
      );
    });
  }
}
