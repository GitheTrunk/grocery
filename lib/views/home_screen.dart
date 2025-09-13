import 'package:flutter/material.dart';
import 'package:grocery/widgets/appbar/custom_appbar.dart';
import 'package:grocery/widgets/appbar/search_bar.dart' as custom;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchText = '';
  bool _isFiltered = false;

  void _onSearchChanged(String value) {
    setState(() {
      _searchText = value;
    });
  }

  void _onFilterTap() {
    setState(() {
      _isFiltered = !_isFiltered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: custom.SearchBar(
                hintText: 'Search products...',
                onSearchChanged: _onSearchChanged,
                onFilterTap: _onFilterTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
