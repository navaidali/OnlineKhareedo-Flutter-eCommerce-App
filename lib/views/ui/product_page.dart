import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_khareedo/controllers/product_provider.dart';
import 'package:online_khareedo/models/sneakers_model.dart';
import 'package:online_khareedo/services/helper.dart';
import 'package:online_khareedo/views/shared/appstyle.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.id, required this.category})
      : super(key: key);

  final String id;
  final String category;

  @override
  State<ProductPage> createState() => _ProductPageState();
}


class _ProductPageState extends State<ProductPage> {
  final PageController pageController = PageController();

  late Future<Sneakers> _sneakers;
  void getShoes() {
    if (widget.category == "Men's Running") {
      _sneakers = Helper().getMaleSneakerById(widget.id);
    } else if (widget.category == "Women's Running") {
      _sneakers = Helper().getFemaleSneakerById(widget.id);
    } else {
      _sneakers = Helper().getKidsSneakerById(widget.id);
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getShoes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Sneakers>(
            future: _sneakers,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              } else {
                final sneaker = snapshot.data;
                return Consumer<ProductNotifier>(
                    builder: (context, productNotifier, child) {
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        leadingWidth: 0,
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: (){ Navigator.pop(context);},
                                child: const Icon(AntIcons.closeOutlined, color: Colors.black,),
                              ),
                              GestureDetector(
                                onTap: null,
                                child: const Icon(AntIcons.ellipsisOutlined, size: 40, color: Colors.black,),
                              )
                            ],
                          ),
                        ),
                        pinned: true,
                        snap: false,
                        floating: true,
                        expandedHeight: MediaQuery.of(context).size.height,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Stack(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width,
                                child: PageView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: sneaker!.imageUrl.length,
                                    controller: pageController,
                                    onPageChanged: (page) {
                                      productNotifier.activePage = page;
                                    },
                                    itemBuilder: (context, int index) {
                                      return Stack(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.39,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: Colors.grey.shade300,
                                            child: CachedNetworkImage(
                                              imageUrl: sneaker.imageUrl[index],
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.13,
                                            right: 20,
                                            child: const Icon(
                                              AntIcons.heartOutlined,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Positioned(
                                              bottom: 0,
                                              //right: 0,
                                              left: MediaQuery.of(context).size.width*0.5,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.28,
                                              child: Row(
                                                children: List<Widget>.generate(
                                                    sneaker!.imageUrl.length,
                                                    (index) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      4),
                                                          child: CircleAvatar(
                                                            radius: 5,
                                                            backgroundColor:
                                                                productNotifier
                                                                            .activePage !=
                                                                        index
                                                                    ? Colors
                                                                        .grey
                                                                    : Colors
                                                                        .black,
                                                          ),
                                                        )),
                                              )),
                                          Positioned(
                                              bottom: MediaQuery.of(context).size.height*0.9,
                                              child: ClipRRect(
                                                borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  topRight: Radius.circular(30),
                                                ),
                                                child: Container(
                                                  height: MediaQuery.of(context).size.height*0.645,
                                                  width: MediaQuery.of(context).size.width,
                                                  color: Colors.white,
                                                  child: Padding(
                                                    padding: EdgeInsets.all(12),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(sneaker.name,style: appstyle(40, Colors.black,FontWeight.bold),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                });
              }
            }));
  }
}
