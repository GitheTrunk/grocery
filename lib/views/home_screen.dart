import 'package:flutter/material.dart';
import 'package:grocery/controllers/home_controller.dart';
import 'package:grocery/widgets/appbar/custom_appbar.dart';
import 'package:grocery/widgets/product/product_grid.dart';
import 'package:grocery/widgets/search_bar.dart' as custom_widgets;
import 'package:grocery/widgets/slider/card_slider.dart';

class HomeScreen extends StatefulWidget {
  final HomeController homeController = HomeController();
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
              onNotificationTap: () {
                Navigator.pushNamed(context, '/notifications');
              },
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: custom_widgets.SearchBar(
                  hintText: 'Search ...',
                  onSearchChanged: (query) {
                    widget.homeController.updateSearch(query);
                  },
                  onFilterTap: () {
                    debugPrint('Filter tapped');
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: CardSlider(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/categories');
                      },
                      child: const Text('See All'),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ProductGrid(
                products: [
                  {
                    'id': '1',
                    'image': 'assets/images/products/green_apple.png',
                    'name': 'Green Apples',
                    'price': 3.99,
                    'unit': '1 kg',
                    'category': 'Fruits',
                  },
                  {
                    'id': '2',
                    'image': 'assets/images/products/orange.png',
                    'name': 'Orange',
                    'price': 3.29,
                    'unit': '1 kg',
                    'category': 'Fruits',
                  },
                  {
                    'id': '3',
                    'image': 'assets/images/products/kiwi.png',
                    'name': 'kiwi',
                    'price': 2.99,
                    'unit': '1 kg',
                    'category': 'Fruits',
                  },
                  {
                    'id': '4',
                    'image': 'assets/images/products/strawberry.png',
                    'name': 'Strawberry',
                    'price': 5.49,
                    'unit': '1 kg',
                    'category': 'Vegetables',
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
