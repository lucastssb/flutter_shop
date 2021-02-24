import 'package:flutter/foundation.dart';
import 'package:flutter_shop/src/models/Cart_item.dart';

class Cart extends ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(CartItem cartItem) {
    if (_items.containsKey(cartItem.id)) {
      _items.update(
        cartItem.id,
        (existingProduct) => CartItem(
          id: existingProduct.id,
          price: existingProduct.price,
          title: existingProduct.title,
          quantity: existingProduct.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        cartItem.id,
        () => CartItem(
            id: DateTime.now().toString(),
            price: cartItem.price,
            title: cartItem.title,
            quantity: 1),
      );
    }
    notifyListeners();
  }
}
