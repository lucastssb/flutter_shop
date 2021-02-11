import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/src/providers/Products_provider.dart';
import 'package:flutter_shop/src/screens/home/widgets/productItem.dart';

class ProductsList extends StatelessWidget {
  final bool showOnlyFavorites;
  final Function onDragItem;
  final Function onStopDragItem;

  ProductsList({
    this.showOnlyFavorites = false,
    @required this.onDragItem,
    @required this.onStopDragItem,
  });

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        showOnlyFavorites ? productsData.favorites : productsData.items;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.6,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: index % 2 == 0
                ? const EdgeInsets.only(left: 10)
                : const EdgeInsets.only(right: 10),
            child: ChangeNotifierProvider.value(
              value: products[index],
              child: ProductItem(
                onDragItem: onDragItem,
                onStopDragItem: onStopDragItem,
              ),
            ),
          );
        },
        childCount: products.length,
      ),
    );
  }
}
