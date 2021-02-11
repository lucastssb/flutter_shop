import 'package:flutter/material.dart';
import 'package:flutter_shop/src/models/Category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.5),
            category.color,
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
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
