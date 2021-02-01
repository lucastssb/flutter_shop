import 'package:flutter/material.dart';
import 'package:flutter_shop/src/models/Product.dart';

class VerticalProductItem extends StatelessWidget {
  final Product product;

  VerticalProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(5),
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
                  Text(
                    '\$ ${product.price}',
                    style: Theme.of(context).textTheme.headline2,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
