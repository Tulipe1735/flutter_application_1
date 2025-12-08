import 'package:flutter/material.dart';

import 'package:flutter_application_1/projects/widgets/nav_bar.dart';

class NavBarScaffold extends StatelessWidget {
  final int currentPageIndex;
  final Widget bodyContent;
  final Color backgroundColor;

  // 路由
  static const Map<int, String> _navRoutes = {
    0: '/search',
    1: '/history',
    2: '/Mine',
  };

  // 组件
  static final List<Map<String, dynamic>> _navItems = [
    {'icon': Icons.home_outlined, 'label': '首页'},
    {'icon': Icons.schedule, 'label': '历史'},
    {'icon': Icons.person_outline, 'label': '我的'},
  ];

  // 模拟火车票数据
  // 调用api时就变成trainTickets1,trainTickets2之类的了
  static List<Map<String, dynamic>> trainTickets = [
    {
      'departureCode': 'Station A',
      'arrivalCode': 'Station B',
      'travelClass': 'Executive',
      'departureTime': DateTime(2025, 1, 1, 9, 0),
      'arrivalTime': DateTime(2025, 1, 1, 16, 0),
      'trainid': 'G101',
    },
    {
      'departureCode': 'Station B',
      'arrivalCode': 'Station C',
      'travelClass': 'First Class',
      'departureTime': DateTime(2025, 1, 1, 10, 0),
      'arrivalTime': DateTime(2025, 1, 1, 15, 0),
      'trainid': 'G102',
    },
    {
      'departureCode': 'Station C',
      'arrivalCode': 'Station D',
      'travelClass': 'Second Class',
      'departureTime': DateTime(2025, 1, 1, 12, 0),
      'arrivalTime': DateTime(2025, 1, 1, 20, 0),
      'trainid': 'G103',
    },
  ];

  const NavBarScaffold({
    super.key,
    required this.currentPageIndex,
    required this.bodyContent,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor, //  让 Scaffold 背景变色

      body: Stack(
        children: [
          // 页面内容
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 100 + 24,
            ),
            child: Container(color: backgroundColor, child: bodyContent),
          ),

          // 底部导航栏
          Positioned(
            left: 20.0,
            right: 20.0,
            bottom: 24.0 + MediaQuery.of(context).padding.bottom,
            child: CustomBottomNavBar(
              initialIndex: currentPageIndex,
              navItems: _navItems,
              navRoutes: _navRoutes,
            ),
          ),
        ],
      ),
    );
  }
}
