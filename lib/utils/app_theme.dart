import 'package:flutter/material.dart';

abstract class AppTheme {
  static const AppBarTheme _staticAppBarTheme = AppBarTheme(
    // 关键：禁用滚动时产生的阴影和颜色变化
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: Color(0xFFEDF7FE), // 一个固定的蓝色
    titleTextStyle: TextStyle(
      fontFamily: "Lora",
      fontSize: 36,
      fontWeight: FontWeight.w400,
    ),
    elevation: 0,
  );

  static ThemeData theme = ThemeData(
    fontFamily: "Poppins",

    // 启用 Material 3
    useMaterial3: true,

    // 应用固定的 AppBar 主题
    appBarTheme: _staticAppBarTheme,

    // 你可以继续添加其他主题设置，例如颜色方案等...
    colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF1E88E5)),
  );
}
