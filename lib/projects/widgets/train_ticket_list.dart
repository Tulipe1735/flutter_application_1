import 'package:flutter/material.dart';
import 'train_ticket.dart';

class TrainTicketList extends StatelessWidget {
  final List<Map<String, dynamic>> tickets;

  const TrainTicketList({super.key, required this.tickets});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const NoGlowBehavior(), // ⬅ 添加这一行即可
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          final ticket = tickets[index];
          return TrainTicketCard(
            departureTime: ticket['departureTime'],
            arrivalTime: ticket['arrivalTime'],
            trainid: ticket['trainid'],
            departureCode: ticket['departureCode'],
            arrivalCode: ticket['arrivalCode'],
            travelClass: ticket['travelClass'],
          );
        },
      ),
    );
  }
}

class NoGlowBehavior extends ScrollBehavior {
  const NoGlowBehavior();

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child; // 不显示任何发光效果
  }
}
