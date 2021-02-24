import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/src/models/Cart_item.dart';
import 'package:flutter_shop/src/providers/Products_provider.dart';

class CartItemOverview extends StatelessWidget {
  final CartItem cartItem;

  CartItemOverview(this.cartItem);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context, listen: false);
    final product = productsData.findById(cartItem.id);
    return Card(
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                Text(product.title),
                Text(product.description),
                Text('\$ ${product.price}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
