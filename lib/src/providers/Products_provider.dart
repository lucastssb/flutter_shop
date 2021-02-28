import 'package:flutter/material.dart';
import 'package:flutter_shop/src/providers/Product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://lh3.googleusercontent.com/proxy/FE2-c03H1IqXcExADOgUveOAOZTjHNLeTkpWUxGYnutX-OyTeF-OTsHL0davd9BQrhocsCOK0TFhRH6ypUiJVfJxmntPF34AjCpnRi3sXPG3jfAsOk-uMCgVDel4SMUfTTQfAGVJ',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://www.pngitem.com/pimgs/m/118-1186230_knitted-yellow-scarf-hd-png-download.png',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  var _isSelected = false;

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favorites {
    return _items.where((item) => item.isFavorite).toList();
  }

  bool get isSelected {
    return _isSelected;
  }

  void onDragItem() {
    _isSelected = true;
    notifyListeners();
  }

  void onStopDragItem() {
    _isSelected = false;
    notifyListeners();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  void addItems() {
    //_items.add();
    notifyListeners();
  }
}
