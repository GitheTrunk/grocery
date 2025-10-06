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
                child: Text(
                  'Categories',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ProductGrid(
                products: [
                  {
                    'image': 'assets/images/products/green_apple.png',
                    'productName': 'Green Apples',
                    'productPrice': '3.99',
                  },
                  {
                    'image': 'assets/images/products/orange.png',
                    'productName': 'Orange',
                    'productPrice': '1.29',
                  },
                  {
                    'image': 'assets/images/products/kiwi.png',
                    'productName': 'Kiwi',
                    'productPrice': '2.49',
                  },
                  {
                    'image': 'assets/images/products/strawberry.png',
                    'productName': 'Strawberry',
                    'productPrice': '2.99',
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
