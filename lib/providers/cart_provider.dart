import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  
  final Map<Product, int> _cartItems = {};

  Map<Product, int> get cartItems => _cartItems;

  // إضافة المنتج إلى السلة: تضيفه مع الكمية 1 أو زيادة كميته
  void addToCart(Product product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1;
    } else {
      _cartItems[product] = 1;
    }
    notifyListeners();
  }

 //تقليل الكمية
  void removeFromCart(Product product) {
    if (_cartItems.containsKey(product) && _cartItems[product]! > 1) {
      _cartItems[product] = _cartItems[product]! - 1;
      notifyListeners();
    }
  }

  
  void removeProduct(Product product) {
    if (_cartItems.containsKey(product)) {
      _cartItems.remove(product);
      notifyListeners();
    }
  }

  // التحقق من وجود منتج في السلة
  bool isProductInCart(Product product) {
    return _cartItems.containsKey(product);
  }

}