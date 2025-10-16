import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/models/category.dart';

class CategoriesController extends GetxController {
  final categories = <Category>[].obs;
  var selectedCategory = 'All'.obs;
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    loadCategories();
    scrollController = ScrollController();
  }

  void loadCategories() {
    categories.assignAll([
      Category(name: 'All', imagePath: ''),
      Category(name: 'Fruits', imagePath: 'assets/icons/categories/fruits.png'),
      Category(
        name: 'Vegetables',
        imagePath: 'assets/icons/categories/vegetables.png',
      ),
      Category(
        name: 'Dairy',
        imagePath: 'assets/icons/categories/dairy-products.png',
      ),
      Category(name: 'Bakery', imagePath: 'assets/icons/categories/bakery.png'),
      Category(name: 'Meat', imagePath: 'assets/icons/categories/meats.png'),
      Category(
        name: 'Beverages',
        imagePath: 'assets/icons/categories/beverages.png',
      ),
    ]);
  }

  void selectCategory(String categoryName) {
    selectedCategory.value = categoryName;
    debugPrint('Selected category: $categoryName');
  }

  bool isSelected(String categoryName) =>
      selectedCategory.value == categoryName;
}
