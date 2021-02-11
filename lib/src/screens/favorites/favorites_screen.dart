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
          SliverToBoxAdapter(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Favorites',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          ProductsList(
            showOnlyFavorites: true,
          ),
        ],
      )),
    );
  }
}
