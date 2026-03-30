## MSI x 葬送的芙莉蓮 聯名顯卡 - 產品展示網頁 (Flutter)

這是一個使用 **Flutter** 打造的精美產品展示網頁 ，完美復刻了微星科技 (MSI) 與《葬送的芙莉蓮》聯名顯示卡 (GeForce RTX™ 5070 Ti 16G FRIEREN EDITION) 的官方宣傳頁面。

專案重點在於實作流暢的**跨裝置 UI 排版**與**互動動畫**，展現了 Flutter 在構建複雜、高互動性單頁式網站上的潛力。

📖 **開發心得紀錄：** [Flutter #2 模仿芙莉連聯名顯卡的官方商品頁面](https://medium.com/@tony9737/1-使用-ai-創作人生第一個-app-小雞過馬路-誕生記-4942d0102326)

## 📸 畫面預覽 (Screenshots)
| 首頁介面 | 箱子動畫 | 相簿輪播 |
| :---: | :---: | :---: |
| <img src="assets\present\首頁.gif" width="250"> | <img src="assets\present\箱子開啟.gif" width="250"> | <img src="assets\present\相簿輪播.gif" width="250"> |



## ✨ 核心特色 (Features)

* **🎥 沉浸式動態影音背景 (Dynamic Video Background)**
    * 使用 `video_player` 套件載入 MP4 影片作為主視覺底圖，大幅提升網頁的科技感與視覺張力。
    * 實作載入後自動播放、靜音與無縫循環 (`setLooping(true)`) 等屬性，確保背景動畫不干擾使用者體驗。

* **📌 沉浸式置頂導覽列 (Sticky Header)**
    * 使用 `CustomScrollView` 與 `SliverPersistentHeader` 實作，當使用者往下滑動時，產品標題與購買導覽列會平滑地吸附在畫面頂部。
* **🎬 捲動互動動畫 (Scroll-Driven Animations)**
    * 結合滑動進度 (`_progress`) 實作拆箱動畫 (Scroll Animated Box)，隨著使用者的滾動，配件箱會呈現開啟與淡入淡出的視覺效果。
* **🖼️ 自動輪播相簿 (Auto-Play Product Gallery)**
    * 自帶圓角設計的縮圖導覽。
    * 整合 `Timer` 實作每 3 秒自動輪播功能，並具備手動點擊後重置計時器的防呆機制。
    * 使用 `AnimatedSwitcher` 達成圖片切換時的柔和淡入淡出。
* **🔮 沉浸式呼吸燈效動畫 (Breathing Glow Animation)**
    * 模擬實體產品「遇熱浮現隱藏文字」的物理特性，使用 `AnimationController` 結合 `CurvedAnimation` 實作平滑的 2.5 秒呼吸燈效。
    * 透過 `repeat(reverse: true)` 讓動畫無限來回播放，並使用 `Stack` 與 `FadeTransition` 將「常態背板」與「發光背板」精準疊加，達成柔和的顯影視覺效果。


## 🛠️ 技術棧 (Tech Stack)

* **Framework:** Flutter
* **Language:** Dart
* **Architecture:** Sliver-based layout (`CustomScrollView`, `SliverToBoxAdapter`)

## 📂 專案結構 (Project Structure)

```text
lib/
├── main.dart                       # 應用程式入口與 CustomScrollView 骨架
├── header/                         # 頁首相關組件
│   ├── msi_brand_bar.dart          # 頂部品牌列
│   └── product_title_bar.dart      # 產品標題與導覽列
├── Body/                           # 網頁各個內容區塊
│   ├── product_content_section.dart      # 產品主視覺介紹
│   ├── product_description_section.dart  # 產品文字敘述
│   ├── design_details_section.dart       # 設計細節 (正面/背板)
│   ├── animated_backplate_section.dart   # 背板動畫區塊
│   ├── scroll_animated_box_section.dart  # 捲動開箱動畫區塊
│   ├── cooling_and_ad_section.dart       # 散熱技術與廣告區塊
│   └── picture_description_section.dart  # 圖文輪播與規格表區塊
└── module/                         # 共用的小型元件與工具
    ├── diamond_marker.dart         # 鑽石圖形標示
    └── sticky_menu_delegate.dart   # SliverPersistentHeader 的 Delegate 實作
```
## 🚀 如何在本地端執行 (How to Run)

如果你想在自己的電腦上編譯並遊玩這款遊戲，請跟著以下步驟操作：

1. **確認環境**：請確保你的電腦已經安裝了 [Flutter SDK](https://docs.flutter.dev/get-started/install) 並配置好開發環境。
2. **克隆專案**： git clone [https://github.com/Tony9737/Flutter-hw2-imitate-msi-productpage.git](https://github.com/Tony9737/Flutter-hw2-imitate-msi-productpage.git)
3. **進入專案目錄**： cd flutter_hw2_frieren
4. **安裝依賴套件**： flutter pub get
5. **執行 App**： flutter run

🤝 致謝 (Acknowledgements)
感謝 Gemini 提供核心架構與邏輯教學。

感謝 GitHub Copilot 在開發過程中的語法補全與加速。

感謝 Flutter 社群提供的強大開源套件。

***