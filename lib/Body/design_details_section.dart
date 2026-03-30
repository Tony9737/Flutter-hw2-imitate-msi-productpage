import 'package:flutter/material.dart';
import 'package:flutter_hw2_frieren/module/diamond_marker.dart';

class DesignDetailsSection extends StatelessWidget {
  const DesignDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20.0),

      child: Column(
        children: [
          // 標題
          const Text(
            '設計細節',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Color(0xFF333333),
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 10),

          // ==================== Part1：正面顯卡 ====================
          // 顯卡圖片與懸浮標籤 (用 LayoutBuilder 來排版)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                // 取得當下圖片的寬度
                final width = constraints.maxWidth;

                return Stack(
                  children: [
                    // 底圖：顯示卡
                    Image.asset(
                      'assets/images/body/DesignDetails/highlight-front.webp',
                      width: width,
                      fit: BoxFit.contain,
                    ),

                    // 標籤 1 (左風扇)
                    Positioned(
                      top: width * 0.15, // 距離頂部的比例
                      left: width * 0.12, // 距離左側的比例
                      child: const DiamondMarker(number: '1'),
                    ),

                    // 標籤 2 (中間上方)
                    Positioned(
                      top: width * 0.05,
                      left: width * 0.512,
                      child: const DiamondMarker(number: '2'),
                    ),

                    // 標籤 3 (中間下方)
                    Positioned(
                      bottom: width * 0.14,
                      left: width * 0.39,
                      child: const DiamondMarker(number: '3'),
                    ),

                    // 標籤 4 (右風扇)
                    Positioned(
                      bottom: width * 0.18,
                      right: width * 0.235,
                      child: const DiamondMarker(number: '4'),
                    ),
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 30),

          // 下方的說明列表
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                _buildDetailItem('1', '芙莉蓮風扇標誌設計'),
                const SizedBox(height: 18),
                _buildDetailItem('2', '自定義RGB燈效'),
                const SizedBox(height: 18),
                _buildDetailItem('3', 'TRI FROZR 4 散熱設計'),
                const SizedBox(height: 18),
                _buildDetailItem('4', '欣梅爾風扇標誌設計'),
              ],
            ),
          ),
          const SizedBox(height: 100),

          // ==================== Part2：顯卡背板 ====================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;

                return Stack(
                  children: [
                    // 底圖：顯卡背板
                    Image.asset(
                      'assets/images/body/DesignDetails/highlight-back.webp',
                      width: width,
                      fit: BoxFit.contain,
                    ),

                    // (蒼月草背板設計)
                    Positioned(
                      top: width * 0.115,
                      left: width * 0.20,
                      child: const DiamondMarker(number: '1'),
                    ),

                    // (雙 bios)
                    Positioned(
                      bottom: width * 0.03,
                      left: width * 0.33,
                      child: const DiamondMarker(number: '2'),
                    ),

                    // (芙莉蓮 魔法陣設計)
                    Positioned(
                      bottom: width * 0.07,
                      right: width * 0.245,
                      child: const DiamondMarker(number: '3'),
                    ),
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 30),

          // 說明列表 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                _buildDetailItem('1', '隱藏溫感變色元素的金屬背板'),
                const SizedBox(height: 18),
                _buildSpcialDetailItem('2', 'src', '雙 bios'),
                const SizedBox(height: 18),
                _buildDetailItem('3', '芙莉蓮 魔法陣設計'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 輔助函式：快速建立下方列表的一列
  Widget _buildDetailItem(String number, String text) {
    return Row(
      children: [
        DiamondMarker(number: number),
        const SizedBox(width: 20),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Color(0xFFDAC287), // 文字的香檳金色
          ),
        ),
      ],
    );
  }

  Widget _buildSpcialDetailItem(String number, String src, String text) {
    return Row(
      children: [
        DiamondMarker(number: number),
        const SizedBox(width: 20),
        SizedBox(
          height: 110,
          child: Image.asset('assets/images/body/DesignDetails/sw1.webp'),
        ),
        const SizedBox(width: 20),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Color(0xFFDAC287),
          ),
        ),
      ],
    );
  }
}
