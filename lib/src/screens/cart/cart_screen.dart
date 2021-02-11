import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const routerName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Draggable<int>(
          data: 100,
          feedback: Container(
            width: 100,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.brown,
            ),
          ),
          child: Container(
            width: 100,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: Text('Hello'),
          ),
        ),
      ),
    );
  }
}
