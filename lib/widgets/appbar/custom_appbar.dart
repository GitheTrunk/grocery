import 'package:flutter/material.dart';
import 'package:grocery/widgets/user_profile.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onNotificationTap;
  const CustomAppBar({super.key, this.onNotificationTap});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      expandedHeight: 10.0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      title: const UserProfile(),
      centerTitle: false,
      actions: [
        if (onNotificationTap != null)
          IconButton(
            icon: const Icon(Icons.notifications),
            color: Theme.of(context).primaryColor,
            onPressed: onNotificationTap,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
