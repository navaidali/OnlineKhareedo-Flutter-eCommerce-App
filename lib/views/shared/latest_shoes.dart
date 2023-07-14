import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:online_khareedo/models/sneakers_model.dart';
import 'package:online_khareedo/views/shared/stagger_tile.dart';

class LatestShoes extends StatelessWidget {
  const LatestShoes({Key? key, required Future<List<Sneakers>> male}) : _male=male;

  final Future<List<Sneakers>> _male;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(
      future: _male,
      builder: (context, snapshot) {
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error ${snapshot.error}");
        } else {
          final male = snapshot.data;
          return StaggeredGridView.countBuilder(
              padding: EdgeInsets.zero,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 16,
              scrollDirection: Axis.vertical,
              itemCount: male!.length,
              staggeredTileBuilder: (index)=>StaggeredTile.extent(
                  (index%2==0)? 1:1, (index %4 ==1 || index%4==3)?
              MediaQuery.of(context).size.height*0.4 : MediaQuery.of(context).size.height *0.35),
              itemBuilder: (context, index) {
                final shoe = snapshot.data![index];
                return StaggerTile(imgUrl: shoe.imageUrl[1], name: shoe.name, price: "\$${shoe.price}");
              });
        }
      },
    );
  }
}
