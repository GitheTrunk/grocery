import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String categoryName;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.image,
    required this.categoryName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).colorScheme.onPrimary,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.0),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 60,
                width: 60,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              categoryName,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
