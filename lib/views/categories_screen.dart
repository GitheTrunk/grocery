import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/widgets/appbar/custome_app_new.dart';
import 'package:grocery/controllers/categories_controller.dart';
import 'package:grocery/widgets/category/category_card.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesState();
}

class _CategoriesState extends State<CategoriesScreen> {
  late final CategoriesController controller =
      Get.isRegistered<CategoriesController>()
      ? Get.find<CategoriesController>()
      : Get.put(CategoriesController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBarNew(
              title: 'Categories',
              onNotificationTap: () {
                Navigator.pushNamed(context, '/notications');
              },
            ),
            Obx(() {
              final cats = controller.categories;
              return SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final category = cats[index];
                    final categoryName = category.name;
                    return Obx(() {
                      final selected =
                          controller.selectedCategory.value == categoryName;
                      return CategoryCard(
                        key: ValueKey(categoryName),
                        image: category.imagePath,
                        categoryName: categoryName,
                        isSeleted: selected,
                        onTap: () => controller.selectCategory(categoryName),
                      );
                    });
                  }, childCount: cats.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.78,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
