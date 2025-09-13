import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onFilterTap;
  const SearchBar({
    super.key,
    this.hintText = 'Search ...',
    this.onSearchChanged,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: onSearchChanged,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Theme.of(context).searchViewTheme.backgroundColor,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 16,
              ),
            ),
          ),
        ),
        if (onFilterTap != null)
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: onFilterTap,
          ),
      ],
    );
  }
}
