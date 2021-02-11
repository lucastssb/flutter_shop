import 'package:flutter/material.dart';
import 'package:flutter_shop/src/models/Category.dart';
import 'package:flutter_shop/src/screens/home/widgets/categoryItem.dart';

class CategoriesList extends StatelessWidget {
  final List<Category> categories;

  CategoriesList(this.categories);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 180,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryItem(categories[index]);
          },
          itemCount: categories.length,
        ),
      ),
    );
  }
}
