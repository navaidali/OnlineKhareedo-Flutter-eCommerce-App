import 'package:flutter/material.dart';

import '../shared/appstyle.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is Profile",
          style: appstyle(40, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}
