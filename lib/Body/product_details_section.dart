import 'package:flutter/material.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFececec),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 35),
          // 產品主標題
          const Text(
            'GeForce RTX™ 5070 Ti 16G FRIEREN EDITION OC',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 22,
              fontWeight: FontWeight.w900,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 25),

          // 顯卡細節
          _buildBulletPoint('搭載NVIDIA Blackwell架構與DLSS 4'),
          _buildRichBulletPoint(
            '核心時脈： \n',
            '極致效能：2580 MHz (MSI Center)\nBoost: 2572 MHz (GAMING & SILENT Mode)',
          ),
          _buildRichBulletPoint(
            'TRI FROZR 4 散熱設計：',
            '升級的風扇、氣流控制和散熱設計提供卓越的散熱效果和更安靜的運行',
          ),
          _buildRichBulletPoint(
            'STORMFORCE 風扇：',
            '七片風扇葉片、爪狀紋理和圓形弧度設計，實現最佳氣流並降低噪音',
          ),
          _buildRichBulletPoint('鍍鎳銅底座：', '捕獲來自GPU和記憶體的熱量，然後迅速將其傳輸到散熱器'),
          _buildRichBulletPoint('方形熱管：', '方形設計的熱管可最大面積接觸GPU底座，以達到最佳散熱效果'),
          _buildRichBulletPoint(
            '金屬背板：',
            '金屬背板：強化金屬背板設計，搭配流通氣流通道與散熱墊，進一步提升散熱效能',
          ),
          _buildRichBulletPoint(
            'Wave Curved 4.0：',
            '精密設計的波浪邊緣，搭配高低鰭片設計，提升氣流並減少湍流',
          ),
          _buildRichBulletPoint(
            'Air Antegrade Fin 2.0：',
            '帶有 V 形切口的鰭片位於氣流通道中，提升流量效率。通過優化鰭片的傾斜角度並增加波浪切口，改變氣流阻力，像噴嘴一樣推動熱空氣更快地排出',
          ),
          _buildRichBulletPoint(
            '雙BIOS：',
            '選擇在GAMING模式下優先考慮效能全開，或在SILENT模式下降低噪音',
          ),
          _buildRichBulletPoint(
            'MSI Center軟體：',
            '微星獨家MSI Center讓您即時監控、調整和優化MSI產品',
          ),
          _buildRichBulletPoint(
            'Afterburner軟體：',
            '透過世界上最受認可、使用最廣泛的顯示卡超頻軟體，可完全掌控顯示卡',
          ),
          const SizedBox(height: 20),

          Column(
            // 設置 Column 為 stretch，讓按鈕自動撐滿父容器的寬度
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 增加一點上方的留白，模擬圖片中與上方區塊的間距
              const SizedBox(height: 10),

              // ==================== 按鈕一 ====================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: ElevatedButton(
                  // 功能留空，僅實作視覺效果
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 218, 9, 9),
                    foregroundColor: Colors.white,
                    // 設定圓角
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    // 設定內距
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    elevation: 0,
                  ),
                  child: const Text('規格', style: TextStyle(fontSize: 16)),
                ),
              ),

              const SizedBox(height: 2),

              // ==================== 按鈕二 ====================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: ElevatedButton(
                  // 功能留空，僅實作視覺效果
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 218, 9, 9),
                    foregroundColor: Colors.white,
                    // 設定圓角
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    // 設定內距
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    elevation: 0,
                  ),
                  child: const Text('立即購買', style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }

  // --- 輔助函式：建立一般條列式項目 ---
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 畫一個白色小圓點作為 Bullet
          const Padding(
            padding: EdgeInsets.only(top: 8.0, right: 12.0),
            child: Icon(
              Icons.circle,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 7,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 15,
                height: 1.45,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- 輔助函式：建立前面帶有「粗體字」的條列式項目 ---
  Widget _buildRichBulletPoint(String boldPrefix, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0, right: 12.0),
            child: Icon(
              Icons.circle,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 6,
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16,
                  height: 1.45,
                ),
                children: [
                  TextSpan(
                    text: boldPrefix,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold, 
                    ),
                  ),
                  TextSpan(text: text),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
