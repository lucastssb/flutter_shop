import 'package:flutter/material.dart';
import 'package:flutter_shop/src/models/Cart_item.dart';
import 'package:flutter_shop/src/providers/Products_provider.dart';
import 'package:flutter_shop/src/widgets/productsList.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/src/models/Category.dart';
import 'package:flutter_shop/src/providers/Cart.dart';
import 'package:flutter_shop/src/screens/cart/cart_screen.dart';
import 'package:flutter_shop/src/screens/favorites/favorites_screen.dart';
import 'package:flutter_shop/src/screens/home/widgets/badge.dart';
import 'package:flutter_shop/src/screens/home/widgets/categoriesList.dart';

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
  var isLanding = false;

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

  Widget appBar(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);

    void draggedHandler(CartItem cartItem) {
      cart.addItem(cartItem);
      setState(() {
        isLanding = false;
      });
    }

    return Scaffold(
      appBar: appBar(context),
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
                  ProductsList(),
                ],
              ),
              Positioned(
                bottom: 10,
                right: 0,
                child: Consumer<Products>(
                  builder: (_, productData, child) {
                    return AnimatedContainer(
                      alignment: Alignment.centerLeft,
                      width: productData.isSelected ? 170 : 0,
                      height: 150,
                      duration: Duration(milliseconds: 300),
                      child: child,
                    );
                  },
                  child: DragTarget<CartItem>(
                    builder: (context, candidates, rejects) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(
                              233, 30, 99, isLanding ? 1.0 : 0.9),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        height: double.infinity,
                        width: 150,
                        child: Icon(
                          isLanding
                              ? Icons.shopping_cart
                              : Icons.shopping_cart_outlined,
                          size: 70,
                          color: Colors.white,
                        ),
                      );
                    },
                    onMove: (value) {
                      if (!isLanding) {
                        setState(() {
                          isLanding = true;
                        });
                      }
                    },
                    onAccept: (value) {
                      draggedHandler(value);
                      print(cart.items);
                    },
                    onWillAccept: (value) => true,
                    onLeave: (value) {
                      if (isLanding) {
                        setState(() {
                          isLanding = false;
                        });
                      }
                    },
                  ),
                ),
              ),
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
