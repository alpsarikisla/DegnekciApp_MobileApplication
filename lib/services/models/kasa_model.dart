import 'package:cloud_firestore/cloud_firestore.dart';

class Kasa {
  final num alinan;
  final String id, otoparkID;
  final Timestamp tarih;
  Kasa(
      {this.id = "",
      required this.otoparkID,
      required this.tarih,
      required this.alinan});

  factory Kasa.fromJson(Map<String, dynamic> json) {
    num alinan = json["alinan"];
    String id = json["id"];
    String otoparkID = json["otopark_id"];
    Timestamp tarih = json["tarih"];

    return Kasa(
      alinan: alinan,
      id: id,
      otoparkID: otoparkID,
      tarih: tarih,
    );
  }
}
