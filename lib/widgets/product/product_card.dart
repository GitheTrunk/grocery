import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String productName;
  final String productPrice;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.image,
    required this.productName,
    required this.productPrice,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 100,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              productName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4.0),
            Text(
              '\$ $productPrice',
              style: TextStyle(fontSize: 14, color: Colors.green),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onAddToCart,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
