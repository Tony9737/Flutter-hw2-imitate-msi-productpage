import 'package:flutter/material.dart';

class DiamondMarker extends StatelessWidget {
  final String number;

  const DiamondMarker({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 旋轉 45 度的正方形背景
          Transform.rotate(
            angle: 0.785398, // 弧度制的 45 度 (pi / 4)
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFDAC287),
                borderRadius: BorderRadius.circular(3), // 微微的圓角
              ),
            ),
          ),
          // 正向的數字文字
          Text(
            number,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 13,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
