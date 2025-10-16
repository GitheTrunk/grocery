import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/controllers/categories_controller.dart';
import 'package:grocery/models/category.dart';
import 'package:grocery/widgets/category/category_card.dart';

class CategoryGrid extends StatefulWidget {
  final List<Category> categories;
  const CategoryGrid({super.key, required this.categories});

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CategoriesController>();
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: widget.categories.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final category = widget.categories[index];
        final categoryName = category.name;
        return Obx(() {
          final isSelected = controller.selectedCategory.value == categoryName;
          return CategoryCard(
            image: category.imagePath,
            categoryName: categoryName,
            isSeleted: isSelected,
            onTap: () {
              controller.selectCategory(categoryName);
            },
          );
        });
      },
    );
  }
}
