import 'package:flutter/material.dart';

class MsiBrandBar extends StatelessWidget {
  const MsiBrandBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 左側：漢堡選單
          const Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 25), // 給左邊一點空間
                Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.menu, color: Colors.grey, size: 20),
                ),
              ],
            ),
          ),

          // 中間：MSI Logo
          Image.asset('assets/images/brand_bar/msi_logo.png', height: 55),

          // 右側：會員與搜尋圖示
          const Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.person_outline, color: Colors.grey, size: 26),
                SizedBox(width: 16),
                Icon(Icons.search, color: Colors.grey, size: 26),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
