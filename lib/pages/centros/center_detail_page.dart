// lib/pages/center_detail_page.dart
import 'package:flutter/material.dart';
import '../models/center_model.dart';

class CenterDetailPage extends StatelessWidget {
  final CenterDetailModel center;

  const CenterDetailPage({super.key, required this.center});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(center.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(center.image),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                center.description,
                style: const TextStyle(fontSize: 16),
              ),
            ),

            ListTile(
              title: const Text("Endereço"),
              subtitle: Text(center.address),
            ),

            ListTile(
              title: const Text("Telefone"),
              subtitle: Text(center.phone),
            ),

            ListTile(
              title: const Text("Horário de funcionamento"),
              subtitle: Text(center.hours),
            ),
          ],
        ),
      ),
    );
  }
}