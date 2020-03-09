import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  void addProduct(Product product) {
    final newProduct = Product(
      name: product.name,
      password: product.password,
      email: product.email,
    );
    _items.add(newProduct);
    
    notifyListeners();
  }
}
