import 'package:flutter/material.dart';

class CustomAppBarNew extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onTitleTap;
  final VoidCallback? onNotificationTap;
  const CustomAppBarNew({
    super.key,
    this.title = '',
    this.onTitleTap,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      expandedHeight: 56.0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      title: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTitleTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      centerTitle: true,
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
