import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../models/center_model.dart';
import '../database/centers_data.dart';

class CenterDetailPage extends StatelessWidget {
  final int centerIndex;

  const CenterDetailPage({
    super.key,
    required this.centerIndex,
  });

  @override
  Widget build(BuildContext context) {
    final CenterDetailModel center = centersData[centerIndex];

    const Color headerBlue = Color(0xFF7CA6C5);
    const Color footerBrown = Color(0xFFC7845E);
    const Color contentWhite = Colors.white;

    return Scaffold(
      backgroundColor: headerBlue,
      appBar: AppBar(
        backgroundColor: headerBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Icon(Icons.change_history, size: 40, color: Colors.white),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                color: contentWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Título
                            Text(
                              center.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 15),

                            // Imagem
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: Image.asset(
                                  center.image,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[300],
                                      child: const Center(
                                        child: Icon(Icons.broken_image,
                                            color: Colors.grey),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Descrição
                            const Text(
                              "Sobre o local",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              center.description,
                              style: const TextStyle(
                                  fontSize: 15,
                                  height: 1.4,
                                  color: Colors.black54),
                            ),
                            const SizedBox(height: 20),

                            // Como doar
                            const Text(
                              "Como Doar",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Para contribuir, basta separar os itens em bom estado e entregar no nosso ponto de arrecadação.",
                              style: TextStyle(
                                  fontSize: 14,
                                  height: 1.4,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),

                      // Footer com mapa
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(25),
                        decoration: const BoxDecoration(
                          color: footerBrown,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Localização",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            const SizedBox(height: 15),

                            // MAPA (flutter_map 8.2.2)
                            Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Colors.white, width: 2),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                child: FlutterMap(
                                  options: MapOptions(
                                    initialCenter:
                                        LatLng(center.lat, center.lng),
                                    initialZoom: 15,
                                    interactionOptions:
                                        const InteractionOptions(
                                      flags: InteractiveFlag.all,
                                    ),
                                  ),
                                  children: [
                                    TileLayer(
                                      urlTemplate:
                                          "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                                      userAgentPackageName:
                                          "com.example.app",
                                    ),
                                    MarkerLayer(
                                      markers: [
                                        Marker(
                                          point:
                                              LatLng(center.lat, center.lng),
                                          child: const Icon(
                                            Icons.location_on,
                                            color: Colors.red,
                                            size: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            _buildFooterInfo(Icons.location_on_outlined,
                                center.address),
                            const SizedBox(height: 12),
                            _buildFooterInfo(Icons.phone, center.phone),
                            const SizedBox(height: 12),
                            _buildFooterInfo(Icons.access_time, center.hours),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterInfo(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.white, size: 22),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              height: 1.2,
            ),
          ),
        ),
      ],
    );
  }
}
