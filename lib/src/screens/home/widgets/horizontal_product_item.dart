import 'package:flutter/material.dart';
import 'package:flutter_shop/src/models/Product.dart';

class HorizontalProductItem extends StatelessWidget {
  final Product product;

  HorizontalProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
        color: Color.fromARGB(255, 100, 200, 210),
      ),
      child: SizedBox(
        width: 300,
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          direction: Axis.horizontal,
          children: [
            Flexible(
              flex: 1,
              child: Text(product.title,
                  style: Theme.of(context).textTheme.headline1),
            ),
            Flexible(
              flex: 1,
              child: Image.asset(
                'assets/images/cloches.png',
                fit: BoxFit.contain,
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
