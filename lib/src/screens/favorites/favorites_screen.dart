import 'package:flutter/material.dart';
import 'package:flutter_shop/src/screens/home/widgets/productsList.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CustomScrollView(
        slivers: [
          ProductsList(
            showOnlyFavorites: true,
          ),
        ],
      )),
    );
  }
}
