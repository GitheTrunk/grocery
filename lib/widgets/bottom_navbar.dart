import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: currentIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).disabledColor,
      onTap: onTap,
      items: [
        SalomonBottomBarItem(icon: Icon(Icons.home), title: Text('Home')),
        SalomonBottomBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text('My Cart'),
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.favorite),
          title: Text('Favorite'),
        ),
        SalomonBottomBarItem(icon: Icon(Icons.person), title: Text('Profile')),
      ],
    );
  }
}
