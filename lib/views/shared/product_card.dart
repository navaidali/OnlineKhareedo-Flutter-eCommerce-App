import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:online_khareedo/views/shared/appstyle.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {Key? key,
      required this.price,
      required this.category,
      required this.name,
      required this.id,
      required this.image})
      : super(key: key);

  final String price;
  final String category;
  final String name;
  final String id;
  final String image;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    bool selected = true;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 20, 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 1,
              blurRadius: 0.6,
              offset: Offset(1, 1),
            ),
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.23,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.image),
                        fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                      onTap: null,
                      child: const Icon(AntIcons.heartOutlined),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: appstyleWithHt(
                          36, Colors.black, FontWeight.bold, 1.1),
                    ),
                    Text(
                      widget.category,
                      style:
                          appstyleWithHt(18, Colors.grey, FontWeight.bold, 1.5),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.price}",
                      style: appstyle(30, Colors.black, FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Text(
                          "Colors",
                          style: appstyle(18, Colors.grey, FontWeight.w500),
                        ),
                        SizedBox(
                          width: 5,
                          child: ChoiceChip(
                            label: const Text(" "),
                            selected: selected,
                            visualDensity: VisualDensity.compact,
                            selectedColor: Colors.black,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
