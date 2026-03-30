import 'package:flutter/material.dart';
import 'dart:async';


class ProductGallerySection extends StatefulWidget {
  const ProductGallerySection({super.key});

  @override
  State<ProductGallerySection> createState() => _ProductGallerySectionState();
}

class _ProductGallerySectionState extends State<ProductGallerySection> {
  // 紀錄目前顯示到第幾張圖 (預設為 0，也就是第一張)
  int _currentIndex = 0;
  // Timer_Init
  Timer? _autoPlayTimer;

  final List<String> _images = [
    'assets/images/body/PictureDescriptionSection/set1.webp',
    'assets/images/body/PictureDescriptionSection/card4.webp',
    'assets/images/body/PictureDescriptionSection/card3.webp',
    'assets/images/body/PictureDescriptionSection/card2.webp',
    'assets/images/body/PictureDescriptionSection/card1.webp',
  ];

  // 在 initState 初始化時啟動計時器
  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  // 在 dispose 元件銷毀時關閉計時器 (重要！防止記憶體洩漏)
  @override
  void dispose() {
    _stopAutoPlay();
    super.dispose();
  }

  // 啟動自動輪播的函式
  void _startAutoPlay() {
    // 確保之前沒有殘留的計時器
    _stopAutoPlay();
    // 設定每 3 秒執行一次 _nextImage()
    _autoPlayTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _nextImage();
    });
  }

  // 停止自動輪播的函式
  void _stopAutoPlay() {
    _autoPlayTimer?.cancel();
    _autoPlayTimer = null;
  }

  void _nextImage() {
    setState(() {
      if (_currentIndex < _images.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0; // 如果到底了，就回到第一張
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFececec),
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          // 上方大圖展示區
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            // 使用 AnimatedSwitcher 讓圖片切換時有柔和的淡入淡出效果
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Image.asset(
                _images[_currentIndex],
                key: ValueKey<int>(_currentIndex), 
                width: double.infinity,
                fit: BoxFit.cover,
                // 防呆機制：如果路徑錯誤會顯示灰色區塊，避免畫面崩潰
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 220,
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: const Text(
                    '圖片載入中/路徑未設定',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // 下方縮圖
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 縮圖列表
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // 動態生成縮圖
                children: List.generate(_images.length, (index) {
                  final isSelected = _currentIndex == index;
                  const double borderRadiusValue = 8.0;
                  return GestureDetector(
                    onTap: () {
                      // 點擊縮圖時，更新當前選中的 index
                      setState(() {
                        _currentIndex = index;
                      });
                      _startAutoPlay();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      width: 50, // 縮圖寬度
                      height: 50, // 縮圖高度
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFB5B5B5)
                            : const Color(0xFFececec),
                        border: Border.all(
                          color: Color.fromARGB(255, 207, 207, 207),
                        ),
                        borderRadius: BorderRadius.circular(borderRadiusValue), // 圖片變圓角
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(borderRadiusValue - 1), 
                        child: Image.asset(
                          _images[index],
                          fit: BoxFit.cover, 
                          errorBuilder: (context, error, stackTrace) =>
                              Container(color: Colors.grey[400]),
                        ),
                    ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
