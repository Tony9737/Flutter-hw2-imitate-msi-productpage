import 'package:flutter_hw2_frieren/Body/animated_backplate_section.dart';
import 'package:flutter_hw2_frieren/Body/cooling_and_ad_section.dart';
import 'package:flutter_hw2_frieren/Body/design_details_section.dart';
import 'package:flutter_hw2_frieren/Body/product_content_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw2_frieren/Body/product_description_section.dart';
import 'package:flutter_hw2_frieren/Body/product_details_section.dart';
import 'package:flutter_hw2_frieren/Body/product_gallery_section.dart';
import 'package:flutter_hw2_frieren/Body/scroll_animated_box_section.dart';
import 'package:flutter_hw2_frieren/module/sticky_menu_delegate.dart';
import 'package:flutter_hw2_frieren/header/product_title_bar.dart';
import 'package:flutter_hw2_frieren/header/msi_brand_bar.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'MSI Product Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MsiProductPage(),
    ),
  );
}

class MsiProductPage extends StatelessWidget {
  const MsiProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 上方的narbar
            const SliverToBoxAdapter(child: MsiBrandBar()),

            // 商品標題列 (懸浮)
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyMenuDelegate(
                minHeight: 85.0,
                maxHeight: 85.0,
                child: const ProductTitleBar(),
              ),
            ),

            // 產品介紹區塊
            const SliverToBoxAdapter(child: ProductContentSection()),

            // 商品文字敘述區塊
            const SliverToBoxAdapter(child: ProductDescriptionSection()),

            // 設計細節區塊
            const SliverToBoxAdapter(child: DesignDetailsSection()),

            // 微焰低語背板動畫區塊
            const SliverToBoxAdapter(child: AnimatedBackplateSection()),

            // 滾動觸發的包裝盒區塊
            const SliverToBoxAdapter(child: ScrollAnimatedBoxSection()),

            // 散熱與廣告區域
            const SliverToBoxAdapter(child: CoolingAndAdSection()),

            // 產品畫廊區域
            const SliverToBoxAdapter(child: ProductGallerySection()),

            // 產品細節區域
            const SliverToBoxAdapter(child: ProductDetailsSection()),
          ],
        ),
      ),
    );
  }
}
