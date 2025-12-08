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
  bool _isSwapping = false;

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
            children: [
              // 左侧 stationA
              Expanded(
                child: AnimatedAlign(
                  alignment: _isSwapping
                      ? Alignment.center
                      : Alignment.centerLeft,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    opacity: _isSwapping ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 300),
                    child: Text(
                      stationA,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),

              // 中间旋转按钮
              AnimatedRotation(
                turns: _isSwapping ? 1 : 0,
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                child: IconButton(
                  icon: Icon(Icons.swap_horiz),
                  onPressed: () {
                    setState(() {
                      _isSwapping = true;
                    });

                    Future.delayed(Duration(milliseconds: 400), () {
                      setState(() {
                        // swap
                        final temp = stationA;
                        stationA = stationB;
                        stationB = temp;
                        _isSwapping = false;
                      });
                    });
                  },
                ),
              ),

              // 右侧 stationB
              Expanded(
                child: AnimatedAlign(
                  alignment: _isSwapping
                      ? Alignment.center
                      : Alignment.centerRight,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    opacity: _isSwapping ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 300),
                    child: Text(
                      stationB,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
