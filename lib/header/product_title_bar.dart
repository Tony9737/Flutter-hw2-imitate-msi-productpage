import 'package:flutter/material.dart';

class ProductTitleBar extends StatelessWidget {
  const ProductTitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFececec), // 調整為更接近原圖的淺灰底色
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 左側：商品名稱 (用 Expanded 讓它自動佔滿剩餘空間)
          const Expanded(
            child: Text(
              'GeForce RTX™ 5070 Ti 16G FRIEREN\nEDITION OC',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w900,
                height: 1.3,
              ),
            ),
          ),

          // 中間：向下箭頭
          const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
          const SizedBox(width: 8),

          // 右側：紅色購物車按鈕
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFCC2027), // MSI 經典紅
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
