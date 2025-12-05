import 'package:flutter/material.dart';
import 'package:flutter_application_1/projects/widgets/nav_bar_scaffold.dart';
import 'package:flutter_application_1/projects/widgets/train_ticket_list.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    const lightBlueBackground = Color(0xFFE8F0F6);

    return Scaffold(
      backgroundColor: lightBlueBackground,
      appBar: AppBar(
        title: Text('Ticket Page'),
        backgroundColor: lightBlueBackground,
      ),
      body: TrainTicketList(tickets: NavBarScaffold.trainTickets),
    );
  }
}
