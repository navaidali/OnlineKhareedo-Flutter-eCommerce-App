import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewShoes extends StatelessWidget {
  const NewShoes({Key? key, required this.imgUrl}) : super(key: key);

  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.28,
      height:
      MediaQuery.of(context).size.height * 12,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 0.8,
            color: Colors.white,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: CachedNetworkImage(
        imageUrl:
        imgUrl,
        fit: BoxFit.contain,
      ),
    );
  }
}
