class ProductModel {
  final String title;
  final String imagePath; // Model එකේ මේ නම එහෙම්ම තිබ්බට කමක් නැහැ
  final String price;
  final String description;

  ProductModel({
    required this.title,
    required this.imagePath,
    required this.price,
    required this.description,
  });

  factory ProductModel.fromFirestore(Map<String, dynamic> data) {
    return ProductModel(
      title: data['title'] ?? 'No Title',
      imagePath: data['imageUrl'] ?? '',
      price: data['price']?.toString() ?? 'LKR 0.00',
      description: data['description'] ?? 'No Description Available.',
    );
  }
}
