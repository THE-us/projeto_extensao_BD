// lib/models/center_model.dart

class CenterDetailModel {
  final String name;
  final String address;
  final String phone;
  final String description;
  
  // Estes são os campos que estavam faltando e causavam o erro:
  final String image; 
  final String hours;
  final double lat;
  final double lng;

  CenterDetailModel({
    required this.name,
    required this.address,
    required this.phone,
    required this.description,
    required this.image,
    required this.hours,
    required this.lat,
    required this.lng,
  });
}