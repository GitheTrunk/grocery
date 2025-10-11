import 'package:flutter/material.dart';
import 'package:grocery/widgets/appbar/custome_app_new.dart';
import 'package:grocery/widgets/category/category_grid.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesState();
}

class _CategoriesState extends State<CategoriesScreen> {
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
            //  SliverToBoxAdapter(
            //     child: Padding(
            //       padding: const EdgeInsets.all(16.0),
            //       child: Text(
            //         'Browse by Category',
            //         style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            //               fontWeight: FontWeight.bold,
            //             ),
            //       ),
            //     ),
            //   ),
            SliverToBoxAdapter(
              child: CategoryGrid(
                categories: [
                  {
                    'image': 'assets/icons/categories/fruits.png',
                    'categoryName': 'Fruits',
                  },
                  {
                    'image': 'assets/icons/categories/beverages.png',
                    'categoryName': 'Vegetables',
                  },
                  {
                    'image': 'assets/icons/categories/dairy-products.png',
                    'categoryName': 'Dairy',
                  },
                  {
                    'image': 'assets/icons/categories/bakery.png',
                    'categoryName': 'Bakery',
                  },
                  {
                    'image': 'assets/icons/categories/meats.png',
                    'categoryName': 'Meat',
                  },
                  {
                    'image': 'assets/icons/categories/beverages.png',
                    'categoryName': 'Beverages',
                  },
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
