import 'package:flutter/material.dart';
import '../models/home_model.dart';

class ProductDetailViewModel extends ChangeNotifier {
  final ProductModel product;

  String _selectedSize = "S";
  bool _isLoading = false;

  ProductDetailViewModel({required this.product});

  // Getters
  String get selectedSize => _selectedSize;
  bool get isLoading => _isLoading;

  void selectSize(String size) {
    _selectedSize = size;
    notifyListeners();
  }

  Future<void> addToCart(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      await Future.delayed(const Duration(milliseconds: 800));

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${product.title} ($selectedSize) added to cart!"),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e"), backgroundColor: Colors.red),
        );
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
