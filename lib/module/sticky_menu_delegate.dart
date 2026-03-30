import 'package:flutter/material.dart';

class StickyMenuDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  StickyMenuDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // 確保 child 填滿Header 空間
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(StickyMenuDelegate oldDelegate) {
    // 當高度或內容改變時才重新渲染
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
