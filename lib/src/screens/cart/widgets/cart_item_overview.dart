import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/src/providers/Cart.dart';
import 'package:flutter_shop/src/models/Cart_item.dart';

class CartItemOverview extends StatelessWidget {
  final CartItem cartItem;
  final String productId;

  CartItemOverview(this.cartItem, this.productId);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      background: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    cartItem.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                height: 100,
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartItem.title,
                        style: Theme.of(context).textTheme.bodyText1),
                    SizedBox(
                      width: mediaQuery.size.width - 148,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Quantity: ${cartItem.quantity}',
                              style: Theme.of(context).textTheme.headline3),
                          Text('\$ ${cartItem.price}',
                              style: Theme.of(context).textTheme.headline2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
