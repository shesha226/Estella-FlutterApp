// product_model.dart
import 'package:flutter/material.dart';

class Product {
  final String name;
  final String brand;
  final String description;
  final double originalPrice;
  final double discountPercentage;
  final String imageUrl;
  final List<String> sizes;
  final List<Color> colors;

  Product({
    required this.name,
    required this.brand,
    required this.description,
    required this.originalPrice,
    required this.discountPercentage,
    required this.imageUrl,
    required this.sizes,
    required this.colors,
  });

  double get discountedPrice =>
      originalPrice - (originalPrice * discountPercentage / 100);
}
