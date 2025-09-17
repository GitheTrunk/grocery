import 'package:flutter/material.dart';
import 'package:grocery/controllers/home_controller.dart';
import 'package:get/get.dart';

class SearchBar extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onFilterTap;

  const SearchBar({
    super.key,
    this.hintText = 'Search ...',
    required this.onSearchChanged,
    required this.onFilterTap,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final HomeController homeController = Get.put(HomeController());
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(
      text: homeController.searchQuery.value,
    );

    _searchController.addListener(() {
      if (_searchController.text != homeController.searchQuery.value) {
        homeController.searchQuery.value = _searchController.text;
        widget.onSearchChanged(_searchController.text);
      }
    });

    ever(homeController.searchQuery, (String value) {
      if (_searchController.text != value) {
        _searchController.text = value;
        _searchController.selection = TextSelection.fromPosition(
          TextPosition(offset: _searchController.text.length),
        );
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: widget.onFilterTap,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      ),
    );
  }
}
