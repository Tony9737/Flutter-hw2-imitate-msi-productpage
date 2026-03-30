import 'package:flutter/material.dart';

class ProductDescriptionSection extends StatelessWidget {
  const ProductDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF2F5FA), // 淡藍紫色底

        image: DecorationImage(
          image: AssetImage(
            'assets/images/body/ProductDescription/商品介紹-bg.png',
          ),
          fit: BoxFit.fitWidth,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
      child: Column(
        children: [
          const SizedBox(height: 100), // 文字直接放背景
          // 內文第一段
          const Text(
            '《葬送的芙莉蓮》以細膩筆觸描繪離別與永恆，陪伴我們思考「旅程的意義」。',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              height: 2.2, // 行高
              color: Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 30),

          // 內文第二段
          const Text(
            '如今，MSI 將那份感動化為現實，推出《葬送的芙莉蓮》獨家聯名系列。以精湛工藝與極致效能，書寫屬於現代冒險者的傳說。',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              height: 2.0,
              color: Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 25), // 分隔線直接放背景
          // 結語
          const Text(
            '你的故事，將就此開啟全新篇章',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, color: Color(0xFF888888)),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
