import 'package:flutter/foundation.dart';
import 'package:hairlogistics/models/Product.dart';

class CartProvider with ChangeNotifier {
  List<Product> _products;

  CartProvider() {
    this._products = [];
  }

  set setProduct(Product product) {
    this._products.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    this._products.removeWhere((element) => element.id == product.id);
    notifyListeners();
  }

  List<Product> get getProduct => this._products;
}
