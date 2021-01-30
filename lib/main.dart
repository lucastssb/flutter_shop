import 'package:flutter/material.dart';
import 'package:flutter_shop/src/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Shop',
      theme: ThemeData(
        primaryColor: Colors.purpleAccent,
        fontFamily: 'Nunito',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Nunito',
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              headline2: TextStyle(
                fontSize: 16,
                fontFamily: 'Nunito',
                color: Colors.black,
              ),
            ),
      ),
      home: HomeScreen(),
    );
  }
}
