import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/src/providers/Cart.dart';
import 'package:flutter_shop/src/screens/cart/cart_screen.dart';
import 'package:flutter_shop/src/screens/home/widgets/badge.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'http://github.com/lucastssb.png',
              ),
            ),
          ),
          Container(
            width: 250,
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Color.fromRGBO(230, 230, 230, 0.8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                contentPadding: EdgeInsets.only(left: 10),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Consumer<Cart>(
            builder: (_, cartData, child) => cartData.itemCount != 0
                ? Badge(
                    child: child,
                    value: cartData.itemCount.toString(),
                  )
                : child,
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => Navigator.of(context).pushNamed(
                CartScreen.routerName,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
