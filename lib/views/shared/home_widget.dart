import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:online_khareedo/views/shared/appstyle.dart';
import 'package:online_khareedo/views/shared/new_shoes.dart';
import 'package:online_khareedo/views/shared/product_card.dart';
import 'package:online_khareedo/views/ui/product_by_cart.dart';
import '../../models/sneakers_model.dart';
class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key, required Future<List<Sneakers>> male, required this.tabIndex}) : _male = male;

  final Future<List<Sneakers>> _male;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.405,
          child: FutureBuilder<List<Sneakers>>(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState ==
                  ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              } else {
                final male = snapshot.data;
                return ListView.builder(
                    itemCount: male!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final shoe = snapshot.data![index];
                      return ProductCard(
                        price: shoe.price,
                        category: shoe.category,
                        name: shoe.name,
                        id: shoe.id,
                        image:shoe.imageUrl[0],
                      );
                    });
              }
            },
          ),),
        Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Shoes",
                    style: appstyle(
                        24, Colors.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductByCart(tabIndex: tabIndex,)));
                    },
                    child: Row(children: [
                      Text(
                        "Show all",
                        style: appstyle(
                            22, Colors.black, FontWeight.w500),
                      ),
                      const Icon(
                        AntIcons.caretRightOutlined,
                        size: 20,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
            child: FutureBuilder<List<Sneakers>>(
              future: _male,
              builder: (context, snapshot) {
                if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error ${snapshot.error}");
                } else {
                  final male = snapshot.data;
                  return ListView.builder(
                      itemCount: male!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final shoe = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: NewShoes(imgUrl: shoe.imageUrl[1]),
                        );
                      });
                }
              },
            )
        )
      ],
    );
  }
}
