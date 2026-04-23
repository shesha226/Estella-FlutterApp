import 'package:flutter/material.dart';
import '../models/cart_model.dart';

class CartViewModel extends ChangeNotifier {
  List<CartItem> _items = [
    CartItem(
      name: "MINIMALIST TRENCH COAT",
      size: "L",
      color: "RED",
      price: 200.0,
      quantity: 2,
      image: "assets/dress1.png",
    ),
    CartItem(
      name: "MINIMALIST TRENCH COAT",
      size: "L",
      color: "RED",
      price: 200.0,
      quantity: 1,
      image: "assets/dress2.png",
    ),
  ];

  List<CartItem> get items => _items;

  double get subTotal {
    return _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void addQuantity(int index) {
    _items[index].quantity++;
    notifyListeners();
  }

  void removeQuantity(int index) {
    if (_items[index].quantity > 1) {
      _items[index].quantity--;
      notifyListeners();
    }
  }
}
