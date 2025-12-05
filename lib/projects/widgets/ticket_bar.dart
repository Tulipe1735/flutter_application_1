import 'package:flutter/material.dart';
import 'package:flutter_application_1/projects/widgets/custom_divider.dart';

class TicketBar extends StatefulWidget {
  const TicketBar({super.key});

  @override
  State<TicketBar> createState() => _TicketBarState();
}

class _TicketBarState extends State<TicketBar> {
  String stationA = "Station A";
  String stationB = "Station B";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(-10, 10),
            blurRadius: 12.0,
          ),
        ],
      ),
      child: Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 左侧 Station A
              AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, anim) =>
                    FadeTransition(opacity: anim, child: child),
                child: Text(
                  stationA,
                  key: ValueKey(stationA), // 必须用于 AnimatedSwitcher
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    final temp = stationA;
                    stationA = stationB;
                    stationB = temp;
                  });
                },
                icon: Icon(Icons.shuffle),
              ),

              // 右侧 Station B
              AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, anim) =>
                    FadeTransition(opacity: anim, child: child),
                child: Text(
                  stationB,
                  key: ValueKey(stationB),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
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
                    "xx / xx",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Today",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),

          CustomDivider(),

          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/check');
            },
            child: Text("Check tickets"),
          ),
        ],
      ),
    );
  }
}
