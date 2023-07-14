import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:online_khareedo/models/sneakers_model.dart';
import 'package:online_khareedo/services/helper.dart';
import 'package:online_khareedo/views/shared/appstyle.dart';
import 'package:online_khareedo/views/shared/category_btn.dart';
import 'package:online_khareedo/views/shared/custom_spacer.dart';
import 'package:online_khareedo/views/shared/latest_shoes.dart';
import 'package:online_khareedo/views/shared/new_shoes.dart';
import 'package:online_khareedo/views/shared/product_card.dart';
import 'package:online_khareedo/views/shared/stagger_tile.dart';

class ProductByCart extends StatefulWidget {
  const ProductByCart({Key? key, required this.tabIndex}) : super(key: key);

  final int tabIndex;

  @override
  State<ProductByCart> createState() => _ProductByCartState();
}

class _ProductByCartState extends State<ProductByCart>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kids;

  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  void getFemale() {
    _female = Helper().getFemaleSneakers();
  }

  void getKids() {
    _kids = Helper().getKidsSneakers();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMale();
    getFemale();
    getKids();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50, left: 10),
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              AntIcons.closeCircleOutlined,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              filter();
                            },
                            child: const Icon(
                              AntIcons.slidersOutlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TabBar(
                      padding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.white,
                      labelStyle: appstyle(24, Colors.white, FontWeight.bold),
                      unselectedLabelColor: Colors.grey.withOpacity(0.6),
                      tabs: const [
                        Tab(
                          text: "Mens Shoes",
                        ),
                        Tab(
                          text: "Women's shoes",
                        ),
                        Tab(
                          text: "Kids Shoes",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2,
                    left: 16,
                    right: 12),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      LatestShoes(male: _male),
                      LatestShoes(male: _female),
                      LatestShoes(male: _kids),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<dynamic> filter(){
    double _value=100;
    return showModalBottomSheet(context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white54,
        builder: (context)=> Container(
          height: MediaQuery.of(context).size.height*0.8,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
               Container(
                 height: 5,
                 width: 40,
                 decoration: const BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(10),),
                   color: Colors.black38,
                 ),
               ),

              SizedBox(
                height: MediaQuery.of(context).size.height*0.7,
                child: Column(
                  children: [
                    const CustomSpacer(),
                    Text("Filter", style: appstyle(40, Colors.black, FontWeight.bold),),
                    const CustomSpacer(),
                    Text("Gender", style: appstyle(20, Colors.black,FontWeight.bold),),

                    const SizedBox(
                      height: 20,
                    ),

                    const Row(
                      children: [
                        CategoryButton(btnColor: Colors.black, label: "Men"),
                        CategoryButton(btnColor: Colors.grey, label: "Women"),
                        CategoryButton(btnColor: Colors.grey, label: "Kids"),
                      ],
                    ),

                    const CustomSpacer(),

                    Text("Category", style: appstyle(20, Colors.black, FontWeight.w600),),

                    const SizedBox(
                      height: 20,
                    ),

                    const Row(
                      children: [
                        CategoryButton(btnColor: Colors.black, label: "Shoes"),
                        CategoryButton(btnColor: Colors.grey, label: "Appreal"),
                        CategoryButton(btnColor: Colors.grey, label: "Accessories"),
                      ],
                    ),

                    const CustomSpacer(),
                    Text("Price", style: appstyle(20, Colors.black, FontWeight.w600),),

                    const SizedBox(
                      height: 20,
                    ),

                    Slider(value: _value,
                        activeColor: Colors.black,
                        inactiveColor: Colors.grey,
                        thumbColor: Colors.black,
                        max: 500,
                        divisions: 50,
                        label: _value.toString(),
                        secondaryTrackValue: 200,
                        onChanged: (double value){

                    }),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
