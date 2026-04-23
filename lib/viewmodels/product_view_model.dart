// product_view_model.dart
import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductViewModel extends ChangeNotifier {
  final Product _product = Product(
    name: "Modern Girl's Blazer",
    brand: "TrendyTrinkets Boutique",
    description:
        "Modern girl's clothing focuses on versatile, stylish, and comfortable pieces like denim jeans",
    originalPrice: 100.0,
    discountPercentage: 30,
    imageUrl: "https://images.unsplash.com/your-image-link",
    sizes: ["XS", "S", "M", "L", "XL"],
    colors: [Colors.red, Colors.black, Colors.green, Colors.orangeAccent],
  );

  Product get product => _product;

  String _selectedSize = "S";
  String get selectedSize => _selectedSize;

  void selectSize(String size) {
    _selectedSize = size;
    notifyListeners();
  }

  void addToCart() {
    print("${_product.name} - Size: $_selectedSize added to cart!");
  }
}
