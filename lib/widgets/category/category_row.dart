import 'package:flutter/material.dart';
import 'package:grocery/models/category.dart';
import 'package:grocery/widgets/category/category_card.dart';

class CategoryRow extends StatelessWidget {
  final List<Category> catgories;
  final String selectedCategory;
  final Function(String) onCategorySelected;
  const CategoryRow({
    super.key,
    required this.catgories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: catgories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = catgories[index];
          final isSelected = category.name == selectedCategory;

          return CategoryCard(
            image: category.imagePath,
            categoryName: category.name,
            isSeleted: isSelected,
            isCompact: true,
            onTap: () => onCategorySelected(category.name),
          );
        },
      ),
    );
  }
}
