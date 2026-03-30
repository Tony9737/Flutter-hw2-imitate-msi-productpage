import 'package:flutter/material.dart';

class AnimatedBackplateSection extends StatefulWidget {
  const AnimatedBackplateSection({super.key});

  @override
  State<AnimatedBackplateSection> createState() =>
      _AnimatedBackplateSectionState();
}

class _AnimatedBackplateSectionState extends State<AnimatedBackplateSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500), // 動畫時長 2.5 秒
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.repeat(reverse: true); // 無限來回循環
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 45.0),
      child: Column(
        children: [
          const Text(
            '微焰低語背板',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
              // letterSpacing: 2.0,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            '金屬背板上的專屬區域採用遇熱產生反應的感溫變\n色油墨。溫度上升時，欣梅爾的經典話語將顯現 —\n「你接下來的人生會漫長到，我們都無法想像吧。」\n— 待冷卻後，字句又會悄然淡去。',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              height: 2.2, // 行高
              color: Color(0xFF666666),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            '這是一個被暖意所揭示，永恆的訊息。',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              height: 2.1, // 行高
              color: Color(0xFF666666),
            ),
          ),

          const SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // 底層：未加熱的背板
                    Image.asset(
                      'assets/images/body/DesignDetails/highlight-down.webp',
                      width: width,
                      fit: BoxFit.contain,
                    ),

                    // 上層：加熱後發光/浮現文字的背板
                    FadeTransition(
                      opacity: _animation,
                      child: Image.asset(
                        'assets/images/body/DesignDetails/highlight-down-hot.png',
                        width: width,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
