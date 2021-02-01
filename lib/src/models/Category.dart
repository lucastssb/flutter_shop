import 'package:flutter/material.dart';

class Category {
  String title;
  Color color;
  String image;

  Category({
    @required this.title,
    this.color = Colors.purple,
    @required this.image,
  });
}
