import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/src/providers/Cart.dart';
import 'package:flutter_shop/src/screens/cart/widgets/cart_item_overview.dart';
import 'package:flutter_shop/src/screens/cart/widgets/cart_total.dart';

class CartScreen extends StatelessWidget {
  static const routerName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Your Cart'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.7,
                  width: double.infinity,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return CartItemOverview(
                        cart.items.values.toList()[index],
                        cart.items.keys.toList()[index],
                      );
                    },
                    itemCount: cart.items.length,
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.3,
                  width: double.infinity,
                  child: CartTotal(cart.totalAmount),
                ),
              ],
            );
          },
        ));
  }
}
