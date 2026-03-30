import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ProductContentSection extends StatefulWidget {
  const ProductContentSection({super.key});

  @override
  State<ProductContentSection> createState() => _ProductContentSectionState();
}

class _ProductContentSectionState extends State<ProductContentSection> {
  // 定義影片播放控制器
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoFuture;

  @override
  void initState() {
    super.initState();
    // 初始化影片播放器
    _controller = VideoPlayerController.asset(
      'assets/images/body/ProductContent/bg.mp4',
    );
    _initializeVideoFuture = _controller!.initialize().then((_) {
      // 確保初始化完成後，設定循環播放、靜音並開始播放
      _controller!.setLooping(true); // 循環播放
      _controller!.setVolume(0); // 靜音 
      _controller!.play(); // 開始播放
      setState(() {}); // 重新建構 UI 以顯示影片
    });
  }

  @override
  void dispose() {
    // 離開頁面時銷毀播放器，節省系統資源
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 使用 Stack 將影片墊在下方，圖片疊在上面
    return Container(
      color: Colors.white, 
      child: Stack(
        children: [
          // 背景影片 
          Positioned.fill(
            child: FutureBuilder(
              future: _initializeVideoFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    _controller!.value.isInitialized) {
                  // 初始化完成，顯示影片，並用 AspectRatio 保持影片比例
                  return AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  );
                } else {
                  // 初始化未完成前，顯示漸層背景
                  return Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFF4F6FB), Color(0xFFE5EAF3)],
                      ),
                    ),
                  );
                }
              },
            ),
          ),

          // Product Column 圖片內容 
          Container(
            color: Colors.transparent, // 透明背景
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 35), // 調整位置
                // NVIDIA Logo
                Image.asset(
                  'assets/images/body/ProductContent/nv.webp',
                  width: 130,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 37),
                // 葬送的芙莉蓮 標題
                Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.65,
                  child: Image.asset(
                    'assets/images/body/ProductContent/frieren-edition-title-tc.webp',
                    width: 190,
                    fit: BoxFit.contain,
                  ),
                ),

                // 芙莉蓮與欣梅爾 人物圖
                // 使用 heightFactor: 0.95 讓底下的顯卡稍微往上疊 5%
                Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.90,
                  child: Image.asset(
                    'assets/images/body/ProductContent/frieren.webp',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.contain,
                  ),
                ),

                // 顯示卡圖
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/body/ProductContent/vga.webp',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.contain,
                  ),
                ),

                // 底部產品名稱 Banner 
                Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 2,
                  child: Image.asset(
                    'assets/images/body/ProductContent/title.webp',
                    width: MediaQuery.of(context).size.width * 0.9,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

