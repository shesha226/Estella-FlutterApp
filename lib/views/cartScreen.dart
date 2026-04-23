import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/cart_view_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3E9F3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'ESTELLA',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Serif',
          ),
        ),
        actions: [
          const Icon(Icons.notifications_none, color: Colors.black),
          const SizedBox(width: 15),
          const CircleAvatar(radius: 18, backgroundColor: Color(0xFFE0E0FF)),
          const SizedBox(width: 20),
        ],
      ),
      body: Consumer<CartViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  'YOUR CART (${viewModel.items.length} ITEMS)',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Serif',
                  ),
                ),
              ),
              const Divider(indent: 20, endIndent: 20, color: Colors.black26),

              // 1. Scrollable List Area
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.items.length,
                  itemBuilder: (context, index) {
                    final item = viewModel.items[index];
                    return _buildCartItem(item, viewModel, index);
                  },
                ),
              ),

              // 2. Bottom Summary Area
              _buildSummarySection(viewModel),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCartItem(dynamic item, CartViewModel viewModel, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFDDE4F0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          // Image Section
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              item.image,
              width: 80,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 80,
                height: 100,
                color: Colors.grey[300],
                child: const Icon(
                  Icons.image_not_supported,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  "SIZE : ${item.size} / COLOR : ${item.color}",
                  style: const TextStyle(fontSize: 11, color: Colors.black87),
                ),
                const SizedBox(height: 15),
                Text(
                  "\$${item.price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          // Action Section (Delete & Quantity)
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.delete, color: Colors.redAccent, size: 22),
              const SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    _qtyBtn(
                      Icons.remove,
                      () => viewModel.removeQuantity(index),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "${item.quantity}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    _qtyBtn(Icons.add, () => viewModel.addQuantity(index)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _qtyBtn(IconData icon, VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, size: 16),
      constraints: const BoxConstraints(),
      padding: const EdgeInsets.all(5),
    );
  }

  // Summary Section (Pink Box)
  Widget _buildSummarySection(CartViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
        color: Color(0xFFFFA9A9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          _priceRow("SUB TOTAL", "\$${viewModel.subTotal.toStringAsFixed(2)}"),
          _priceRow("DELIVERY FEE", "\$0.00"),
          _priceRow("ADDRESS", "HANWELLA, SRI LANKA"),
          const Divider(color: Colors.black12),
          _priceRow(
            "TOTAL PRICE",
            "\$${viewModel.subTotal.toStringAsFixed(2)}",
            isBold: true,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEB0000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "PROCEED TO CHECKOUT",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.w900 : FontWeight.bold,
              fontSize: 13,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.w900 : FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
