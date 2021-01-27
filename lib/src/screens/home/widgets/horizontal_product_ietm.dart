import 'package:flutter/material.dart';
import 'package:flutter_shop/src/models/Product.dart';

class HorizontalProductItem extends StatelessWidget {
  final Product product;

  HorizontalProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Card(
      child: SizedBox(
        width: mediaQuery.size.width * 0.8,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              child: Column(
                children: [
                  Text(product.title),
                  Text(product.description),
                  Text('\$ ${product.price}')
                ],
              ),
            ),
            Flexible(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* Column(
              children: [
                Text(product.title),
                Text(product.description),
                Text('\$ ${product.price}')
              ],
            ),
            Expanded(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ), */
