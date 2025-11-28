import 'package:flutter/material.dart';
import 'package:flutter_application_1/projects/widgets/custom_divider.dart';

class TicketBar extends StatelessWidget {
  const TicketBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.1), // 建议使用带透明度的颜色
            offset: Offset(-10, 10), // 偏移位置
            blurRadius: 12.0, // 增加模糊，使边缘柔和
            spreadRadius: 0.0, // 保持阴影大小不变 (或微小扩散)
          ),
        ],
      ),

      child: Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Station A",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.shuffle)),
              Text(
                "Station B",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          CustomDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 10,
                children: [
                  Text(
                    "xx / xx ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    "Today ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(),
            ],
          ),
          CustomDivider(),
          ElevatedButton(onPressed: () {}, child: Text("Check tickets")),
        ],
      ),
    );
  }
}
