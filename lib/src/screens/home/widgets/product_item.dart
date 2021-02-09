import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/src/providers/Product.dart';
import 'package:flutter_shop/src/screens/product_details/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        ProductDetailsScreen.routerName,
        arguments: product.id,
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromARGB(255, 240, 240, 240),
        ),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                          product.description,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${product.price}',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Consumer<Product>(
                          builder: (ctx, product, _) => IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              product.toggleFavoriteStatus();
                            },
                            icon: product.isFavorite
                                ? Icon(
                                    Icons.favorite,
                                    size: 28,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    size: 28,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
