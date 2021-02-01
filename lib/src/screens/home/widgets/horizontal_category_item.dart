import 'package:flutter/material.dart';
import 'package:flutter_shop/src/models/Category.dart';

class HorizontalCategoryItem extends StatelessWidget {
  final Category category;

  HorizontalCategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: category.color,
      ),
      child: SizedBox(
        width: 300,
        height: 200,
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          direction: Axis.horizontal,
          children: [
            Flexible(
              flex: 1,
              child: Text(category.title,
                  style: Theme.of(context).textTheme.headline1),
            ),
            Flexible(
              flex: 1,
              child: Image.asset(
                category.image,
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
