// lib/models/center_model.dart

class CenterDetailModel {
  final String name;
  final String address;
  final String hours;
  final String image;
  final String description;
  final String phone;
  final double lat;
  final double lng;

  CenterDetailModel({
    required this.name,
    required this.address,
    required this.hours,
    required this.image,
    required this.description,
    required this.phone,
    required this.lat,
    required this.lng,
  });
}