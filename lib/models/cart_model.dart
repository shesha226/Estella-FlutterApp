class CartItem {
  final String name;
  final String image;
  final String size;
  final String color;
  double price;
  int quantity;

  CartItem({
    required this.name,
    required this.image,
    required this.size,
    required this.color,
    required this.price,
    required this.quantity,
  });
}
