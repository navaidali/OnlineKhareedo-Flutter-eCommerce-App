import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class BotomNavWidget extends StatelessWidget {
  const BotomNavWidget({Key? key, this.onTap, this.icon}) : super(key: key);
  final void Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 36,
        width: 36,
        child: Icon(icon, color: Colors.white,),
      ),
    );
  }
}
