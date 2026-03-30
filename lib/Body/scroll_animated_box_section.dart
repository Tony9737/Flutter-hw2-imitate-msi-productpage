import 'package:flutter/material.dart';

class ScrollAnimatedBoxSection extends StatefulWidget {
  const ScrollAnimatedBoxSection({super.key});

  @override
  State<ScrollAnimatedBoxSection> createState() =>
      _ScrollAnimatedBoxSectionState();
}

class _ScrollAnimatedBoxSectionState extends State<ScrollAnimatedBoxSection> {
  double _progress = 0.0;
  ScrollPosition? _scrollPosition;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 取得上層的 Scrollable (也就是 CustomScrollView 的滾動控制器)
    _scrollPosition?.removeListener(_onScroll);
    _scrollPosition = Scrollable.of(context).position;
    // 加上監聽器，只要畫面一滾動就觸發
    _scrollPosition?.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollPosition?.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (!mounted) return;
    final RenderObject? renderObject = context.findRenderObject();
    if (renderObject == null || !renderObject.attached) return;

    final renderBox = renderObject as RenderBox;

    // 取得這個 Widget 頂部距離「螢幕最頂端」的 Y 軸距離
    final positionY = renderBox.localToGlobal(Offset.zero).dy;
    final screenHeight = MediaQuery.of(context).size.height;

    // 定義動畫開始與結束的觸發點
    // 當區塊出現在螢幕下方 80% 的位置時，開始動畫 (進度 0.0)
    double startAnimY = screenHeight * 0.8;
    // 當區塊滾動到螢幕上方 30% 的位置時，動畫完成 (進度 1.0)
    double endAnimY = screenHeight * 0.3;

    // 計算目前的進度比例
    double rawProgress = (startAnimY - positionY) / (startAnimY - endAnimY);

    // 將進度限制在 0.0 到 1.0 之間
    double clampedProgress = rawProgress.clamp(0.0, 1.0);

    // 進度改變時才更新畫面，節省效能
    if (_progress != clampedProgress) {
      setState(() {
        _progress = clampedProgress;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0), // 上下留白
      child: Column(
        children: [
          const SizedBox(height: 65),

          // 箱子動畫區域
          SizedBox(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // 第一層：關上的箱子
                // 邏輯：在進度 0.0 ~ 0.5 時，透明度從 1.0 降到 0.0
                Opacity(
                  opacity: (1.0 - (_progress * 2)).clamp(0.0, 1.0),
                  child: Image.asset(
                    'assets/images/body/SetContent/acc-box01.webp',
                    width: 380,
                    fit: BoxFit.contain,
                  ),
                ),
                // 第二層：半關的箱子
                // 邏輯：進度 0.0 ~ 0.5 時淡入 (0->1)，進度 0.5 ~ 1.0 時淡出 (1->0)
                Opacity(
                  opacity: (1.0 - ((_progress - 0.5).abs() * 2)).clamp(
                    0.0,
                    1.0,
                  ),
                  child: Image.asset(
                    'assets/images/body/SetContent/acc-box01.webp',
                    width: 380,
                    fit: BoxFit.contain,
                  ),
                ),
                // 第三層：全開的箱子
                // 邏輯：在進度 0.5 ~ 1.0 時，透明度從 0.0 升到 1.0
                Opacity(
                  opacity: ((_progress - 0.5) * 2).clamp(0.0, 1.0),
                  child: Image.asset(
                    'assets/images/body/SetContent/acc-box03.png',
                    width: 380,
                    fit: BoxFit.contain,
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
