import 'package:flutter/material.dart';

class CoolingAndAdSection extends StatelessWidget {
  const CoolingAndAdSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 450,
          width: 450,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/body/SetContent/set_text_bg.png',
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                '正如欣梅爾希望被銘記，MSI 也盼成為你記憶的一\n部分。這款芙莉蓮聯名顯卡將在遊戲、創作與工作\n中一路相伴—成為塑造你人生旅程的一段篇章。',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 2.0,
                  color: Color(0xFF444444),
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                '隨貨附贈的柔軟、舒適毛毯向《葬送的芙莉蓮》致\n意。承載著魔法、記憶與勇者一行的羈絆，無論旅\n程暫停何處，都能帶來一抹靜謐的暖意。',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 2.0,
                  color: Color(0xFF444444),
                ),
              ),
            ],
          ),
        ),

        Container(
          height: 610,
          width: 450,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/body/ProductContent/cooling_bg.png',
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 90),
              const Text(
                'TRI FROZR 4 散熱設計',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF333333),
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '升級的風扇、提升的氣流控制以及頂尖的散熱創新\n技術，提供卓越的散熱效果和更安靜的運行，顯著\n提升顯示卡的整體效能。',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 2.0,
                  color: Color(0xFF666666),
                ),
              ),
              const SizedBox(height: 130),
              Image.asset(
                'assets/images/body/ProductContent/frozr-vga.webp',
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),

        Image.asset(
          'assets/images/body/ProductContent/ad.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),

        Image.asset(
          'assets/images/body/ProductContent/Partner_merchants.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
