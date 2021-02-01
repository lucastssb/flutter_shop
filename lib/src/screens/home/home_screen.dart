import 'package:flutter/material.dart';
import 'package:flutter_shop/src/models/Category.dart';
import 'package:flutter_shop/src/models/Product.dart';
import 'package:flutter_shop/src/screens/home/widgets/horizontal_category_item.dart';
import 'package:flutter_shop/src/screens/home/widgets/vertical_product_item.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

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
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Shop'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  height: mediaQuery.size.height * 0.22,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HorizontalCategoryItem(categories[index]);
                    },
                    itemCount: products.length,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    'Deals',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.7,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: index % 2 == 0
                          ? EdgeInsets.only(left: 10)
                          : EdgeInsets.only(right: 10),
                      child: VerticalProductItem(products[index]),
                    );
                  },
                  childCount: products.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
