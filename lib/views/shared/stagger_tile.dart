import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_khareedo/views/shared/appstyle.dart';

class StaggerTile extends StatefulWidget {
  const StaggerTile({Key? key, required this.imgUrl, required this.name, required this.price}) : super(key: key);

  final String imgUrl;
  final String name;
  final String price;

  @override
  State<StaggerTile> createState() => _StaggerTileState();
}

class _StaggerTileState extends State<StaggerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16),),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(imageUrl: widget.imgUrl, fit: BoxFit.fill,),
            Container(
              padding: const EdgeInsets.only(top: 9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name, style: appstyleWithHt(20, Colors.black, FontWeight.w700,1),),
                  Text(widget.price, style: appstyleWithHt(20, Colors.black, FontWeight.w500, 2),),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
