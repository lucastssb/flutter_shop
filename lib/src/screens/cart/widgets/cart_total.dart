import 'package:flutter/material.dart';

class CartTotal extends StatelessWidget {
  final double total;

  CartTotal(this.total);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: Theme.of(context).textTheme.bodyText2),
                Text('\$ $total', style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            padding: EdgeInsets.all(10),
            child: TextButton(
              child: Text('Check out',
                  style: Theme.of(context).textTheme.headline1),
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor),
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(double.infinity, 60.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
