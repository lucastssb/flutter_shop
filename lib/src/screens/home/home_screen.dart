import 'package:flutter/material.dart';
import 'package:flutter_shop/src/models/Category.dart';
import 'package:flutter_shop/src/screens/home/widgets/categoriesList.dart';
import 'package:flutter_shop/src/screens/home/widgets/productsList.dart';

class HomeScreen extends StatelessWidget {
  static const routerName = '/';

  final List<Category> categories = [
    Category(
        title: "Cloches",
        image: "assets/images/cloches.png",
        color: Colors.cyan),
    Category(
      title: "Phones",
      image: "assets/images/phone.png",
      color: Colors.pinkAccent,
    ),
    Category(
      title: "TVs",
      image: "assets/images/tv.png",
      color: Colors.lightGreen,
    ),
    Category(
        title: "Laptops",
        image: "assets/images/laptop.png",
        color: Colors.amber),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Shop'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
            slivers: [
              CategoriesList(categories),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    'Deals',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
              ProductsList(),
            ],
          );
        },
      ),
    );
  }
}
