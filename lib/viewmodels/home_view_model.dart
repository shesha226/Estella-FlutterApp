import 'package:flutter/foundation.dart';
import '../models/home_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  void fetchHomeData() {
    _products = [
      ProductModel(
        title: "Floral Midi Dress",
        description: "A chic floral midi dress perfect for spring.",
        price: "\$50.00",
        imagePath: "assets/images/dress1.png",
      ),
      ProductModel(
        title: "Floral Midi Dress",
        description: "A chic floral midi dress perfect for spring.",
        price: "\$50.00",
        imagePath: "assets/images/dress1.png",
      ),
      ProductModel(
        title: "Floral Midi Dress",
        description: "A chic floral midi dress perfect for spring.",
        price: "\$50.00",
        imagePath: "assets/images/dress1.png",
      ),
      ProductModel(
        title: "Floral Midi Dress",
        description: "A chic floral midi dress perfect for spring.",
        price: "\$80.00",
        imagePath: "assets/images/Gemini_Generated_Image_556xtz556xtz556x.png",
      ),
      ProductModel(
        title: "Floral Midi Dress",
        description: "A chic floral midi dress perfect for spring.",
        price: "\$70.00",
        imagePath: "assets/images/dress3.png",
      ),
      ProductModel(
        title: "Floral Midi Dress",
        description: "A chic floral midi dress perfect for spring.",
        price: "\$90.00",
        imagePath: "assets/images/dress4.png",
      ),
    ];
    notifyListeners();
  }
}
