import 'package:flutter/material.dart';
import 'package:online_khareedo/views/shared/appstyle.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton(
      {Key? key, this.onPress, required this.btnColor, required this.label})
      : super(key: key);

  final void Function()? onPress;
  final Color btnColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.255,
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: btnColor,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(9),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: appstyle(23, btnColor, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
