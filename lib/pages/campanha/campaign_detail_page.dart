// lib/pages/campaign_detail_page.dart
import 'package:flutter/material.dart';
import '../models/campaign_model.dart';

class CampaignDetailPage extends StatelessWidget {
  final CampaignModel campaign;

  const CampaignDetailPage({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(campaign.title)),
      body: Column(
        children: [
          Image.asset(campaign.image),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              campaign.description,
              style: const TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}