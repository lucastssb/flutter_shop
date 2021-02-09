import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/src/providers/Products_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routerName = '/product-details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      body: Center(
        child: Text(loadedProduct.title),
      ),
    );
  }
}
