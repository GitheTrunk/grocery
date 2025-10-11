import 'package:flutter/material.dart';
import 'package:grocery/models/product.dart';
import 'package:grocery/widgets/product/product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: products.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.70,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          product: Product(
            id: product['id'] ?? '',
            name: product['name'] ?? 'Unknown',
            image: product['image'] ?? 'assets/icons/loading.png',
            price: product['price'] ?? 0.0,
            unit: product['unit'] ?? '',
            category: product['category'] ?? 'Unrecognized',
          ),
          onAddToCart: () async {
            await Future.delayed(const Duration(milliseconds: 300));
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  duration: const Duration(seconds: 1),
                  content: Text('${product['productName']} added to cart'),
                ),
              );
            }
          },
        );
      },
    );
  }
}
