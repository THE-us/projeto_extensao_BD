// lib/database/centers_data.dart
import '../models/center_model.dart';

final List<CenterDetailModel> centersData = [
  CenterDetailModel(
    name: "Centro Cristo Rei",
    image: "assets/imgs/mcqueen.jpg", // <-- caminho correto
    description: "Aqui entra a descrição detalhada do centro...",
    address: "Rua Exemplo, 123 - Cidade Tal",
    phone: "(11) 99999-9999",
    hours: "07:00 às 19:00",
    lat: -23.5567,
    lng: -46.6623,
  ),

  CenterDetailModel(
    name: "Centro Bom Pastor",
    image: "assets/imgs/bom_pastor.jpg", // Ajuste depois se existir
    description: "Descrição específica deste centro...",
    address: "Av. Exemplo, 987 - Centro",
    phone: "(11) 98888-8888",
    hours: "08:00 às 20:00",
    lat: -23.5501,
    lng: -46.6354,
  ),
];