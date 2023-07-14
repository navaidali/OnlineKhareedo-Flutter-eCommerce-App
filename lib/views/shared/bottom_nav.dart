import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:online_khareedo/controllers/mainscreen_provider.dart';
import 'package:provider/provider.dart';
import 'bottomNavWidget.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(builder: (context, mainScreenNotifier, child){
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BotomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex=0;
                  },
                  icon: mainScreenNotifier.pageIndex==0? Ionicons.home: Ionicons.home_outline,
                ),
                BotomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex=1;
                  },
                  icon: mainScreenNotifier.pageIndex==1? Ionicons.search : Ionicons.search_circle_outline,
                ),
                BotomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex=2;
                  },
                  icon: mainScreenNotifier.pageIndex==2?Ionicons.add : Ionicons.add_circle_outline,
                ),
                BotomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex=3;
                  },
                  icon: mainScreenNotifier.pageIndex==3? Ionicons.cart : Ionicons.cart_outline,
                ),
                BotomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex=4;
                  },
                  icon: mainScreenNotifier.pageIndex==4? Ionicons.person : Ionicons.person_circle,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
