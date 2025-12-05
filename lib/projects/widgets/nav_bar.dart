import 'package:flutter/material.dart';

// --- 自定义导航项 Widget ---

// --- 1. 样式常量定义 ---
const Color activeColor = Color(0xFF2B55A8); // 选中项颜色 (深蓝)
const Color activeBgColor = Color(0xFFE8EAF6); // 选中项背景 (浅蓝)
const Color inactiveColor = Colors.black87; // 未选中项颜色

// --- 2. 单个导航项组件 (CustomNavItem) ---
// 负责渲染图标、文字以及选中时的动画效果
class CustomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // 使用 Expanded 确保每个导航项平均分配宽度
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque, // 扩大点击区域
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 图标 + 圆形背景容器 (使用 AnimatedContainer 实现过渡动画)
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // 核心逻辑：选中显示浅蓝背景，未选中背景透明
                  color: isSelected ? activeBgColor : Colors.transparent,
                ),
                child: Icon(
                  icon,
                  // 核心逻辑：选中显示深蓝图标，未选中显示深灰图标
                  color: isSelected ? activeColor : inactiveColor,
                  size: 24,
                ),
              ),
              const SizedBox(height: 4),
              // 文字标签
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? activeColor : inactiveColor,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- 3. 完整的胶囊式底部导航栏组件 (CustomBottomNavBar) ---
// 负责容器样式(阴影/圆角)、状态管理和路由跳转逻辑
class CustomBottomNavBar extends StatefulWidget {
  final int initialIndex;
  final List<Map<String, dynamic>> navItems;
  final Map<int, String> navRoutes;

  const CustomBottomNavBar({
    super.key,
    required this.initialIndex,
    required this.navItems,
    required this.navRoutes,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  // 处理点击逻辑
  void _onItemTapped(int index) {
    // 1. 如果点击当前页，不做操作
    if (_selectedIndex == index) return;

    // 2. 更新选中状态 UI
    setState(() {
      _selectedIndex = index;
    });

    // 3. 执行路由跳转
    String? routeName = widget.navRoutes[index];
    if (routeName != null) {
      // 移除所有旧路由，跳转到新页面
      Navigator.pushReplacementNamed(context, routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // 胶囊高度
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      // --- 核心装饰样式：白色背景 + 圆角 + 阴影 ---
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50), // 胶囊圆角
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12), // 柔和的阴影
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      // --- 内部布局 ---
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widget.navItems.length, (index) {
          final item = widget.navItems[index];

          return CustomNavItem(
            // 确保类型安全转换
            icon: item['icon'] as IconData,
            label: item['label'] as String,
            isSelected: _selectedIndex == index,
            onTap: () => _onItemTapped(index),
          );
        }),
      ),
    );
  }
}
