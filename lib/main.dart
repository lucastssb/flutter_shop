import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/src/providers/Cart.dart';
import 'package:flutter_shop/src/screens/cart/cart_screen.dart';
import 'package:flutter_shop/src/screens/product_details/product_details_screen.dart';
import 'package:flutter_shop/src/providers/Products_provider.dart';
import 'package:flutter_shop/src/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Shop',
        theme: ThemeData(
          primaryColor: Colors.pink,
          fontFamily: 'Nunito',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                bodyText2: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                ),
                headline1: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                headline2: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Nunito',
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                headline3: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Nunito',
                  color: Colors.black,
                ),
              ),
        ),
        routes: {
          HomeScreen.routerName: (ctx) => HomeScreen(),
          ProductDetailsScreen.routerName: (ctx) => ProductDetailsScreen(),
          CartScreen.routerName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
