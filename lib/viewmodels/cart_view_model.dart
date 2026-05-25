import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/cart_model.dart';

class CartViewModel extends ChangeNotifier {
  List<CartItem> _items = [];
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

  Future<void> addToCart(dynamic product) async {
    double parsedPrice =
        double.tryParse(product.price.replaceAll(RegExp(r'[^0-9.]'), '')) ??
        0.0;

    int index = _items.indexWhere((item) => item.name == product.title);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(
        CartItem(
          name: product.title,
          size: "S",
          color: "Default",
          price: parsedPrice,
          quantity: 1,
          image: product.imagePath,
        ),
      );
    }
    notifyListeners();

    try {
      await FirebaseFirestore.instance.collection('cart').add({
        'name': product.title,
        'price': parsedPrice,
        'image': product.imagePath,
        'size': 'S',
        'color': 'Default',
        'quantity': 1,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print("Product successfully saved to Firebase Firestore!");
    } catch (e) {
      print("Error saving to Firebase: $e");
    }
  }
}
