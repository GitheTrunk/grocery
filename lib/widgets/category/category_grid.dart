import 'package:flutter/material.dart';
import 'package:grocery/widgets/category/category_card.dart';

class CategoryGrid extends StatelessWidget {
  final List<Map<String, String>> categories;
  const CategoryGrid({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: categories.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoryCard(
          image: category['image']!,
          categoryName: category['categoryName']!,
          onTap: () {
            debugPrint('Category ${category['categoryName']} tapped');
          },
        );
      },
    );
  }
}
