import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/src/models/Category.dart';
import 'package:flutter_shop/src/providers/Cart.dart';
import 'package:flutter_shop/src/screens/cart/cart_screen.dart';
import 'package:flutter_shop/src/screens/favorites/favorites_screen.dart';
import 'package:flutter_shop/src/screens/home/widgets/badge.dart';
import 'package:flutter_shop/src/screens/home/widgets/categoriesList.dart';
import 'package:flutter_shop/src/screens/home/widgets/productsList.dart';

class Home extends StatefulWidget {
  final List<Category> categories = [
    Category(
        title: "Cloches",
        image: "assets/images/cloches.png",
        color: Colors.cyan),
    Category(
      title: "Phones",
      image: "assets/images/phone.png",
      color: Colors.pinkAccent,
    ),
    Category(
      title: "TVs",
      image: "assets/images/tv.png",
      color: Colors.lightGreen,
    ),
    Category(
        title: "Laptops",
        image: "assets/images/laptop.png",
        color: Colors.amber),
  ];
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var isSelected = false;

  void onDragItem() {
    setState(() {
      isSelected = true;
    });
  }

  void onStopDragItem() {
    setState(() {
      isSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Shop'),
        actions: [
          Consumer<Cart>(
            builder: (_, cartData, child) => Badge(
              child: child,
              value: cartData.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => Navigator.of(context).pushNamed(
                CartScreen.routerName,
              ),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  CategoriesList(widget.categories),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: Text(
                        'Deals',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                  ProductsList(
                    onDragItem: onDragItem,
                    onStopDragItem: onStopDragItem,
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 10,
                child: AnimatedContainer(
                  width: 100,
                  height: isSelected ? 200 : 0,
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  static const routerName = '/';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _screens = [
    Home(),
    FavoritesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      body: _screens[_selectedIndex],
    );
  }
}
