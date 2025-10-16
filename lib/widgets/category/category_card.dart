import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final String image;
  final String categoryName;
  final bool isSeleted;
  final bool isCompact;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.image,
    required this.categoryName,
    this.isSeleted = false,
    this.isCompact = false,
    this.onTap,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    final imageWidget = ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      child: (widget.image.isNotEmpty)
          ? Image.asset(
              widget.image,
              fit: BoxFit.cover,
              height: widget.isCompact ? 30 : 50,
              width: widget.isCompact ? 30 : 50,
              errorBuilder: (context, error, stackTrace) => Container(
                height: widget.isCompact ? 20 : 50,
                width: widget.isCompact ? 20 : 50,
                color: Colors.black,
                child: Icon(
                  Icons.image_not_supported,
                  size: widget.isCompact ? 18 : 22,
                  color: Colors.grey[500],
                ),
              ),
            )
          : Container(
              height: widget.isCompact ? 30 : 50,
              width: widget.isCompact ? 30 : 50,
              color: Colors.grey[200],
              child: Icon(
                Icons.category,
                size: widget.isCompact ? 16 : 22,
                color: widget.isSeleted
                    ? Theme.of(context).colorScheme.onPrimary
                    : Colors.black,
              ),
            ),
    );
    final textWidget = Flexible(
      child: Text(
        widget.categoryName,
        style: TextStyle(
          fontSize: widget.isCompact ? 12 : 16,
          fontWeight: FontWeight.w600,
          color: widget.isSeleted
              ? Theme.of(context).colorScheme.onPrimary
              : Colors.black,
        ),
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
    return Card(
      color: widget.isSeleted
          ? Theme.of(context).colorScheme.primary
          : Colors.white,
      elevation: widget.isSeleted ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: widget.isSeleted
            ? BorderSide(color: Theme.of(context).colorScheme.primary, width: 2)
            : BorderSide.none,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: widget.onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: widget.isCompact ? 8 : 0,
            horizontal: widget.isCompact ? 12 : 0,
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: widget.isCompact
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      imageWidget,
                      const SizedBox(width: 10),
                      textWidget,
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      imageWidget,
                      const SizedBox(height: 10),
                      textWidget,
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
