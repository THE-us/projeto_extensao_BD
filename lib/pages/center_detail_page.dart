// lib/pages/center_detail_page.dart
import 'package:flutter/material.dart';
import '../models/center_model.dart';

class CenterDetailPage extends StatelessWidget {
  final DonationCenterModel center;

  const CenterDetailPage({super.key, required this.center});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(center.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(center.image),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(center.address),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Horário: ${center.hours}"),
          )
        ],
      ),
    );
  }
}