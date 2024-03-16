import 'package:cloud_firestore/cloud_firestore.dart';

class Arac {
  final String id;
  final String plaka;
  final Timestamp tarih;
  Arac({this.id = "", required this.plaka, required this.tarih});

  factory Arac.fromJson(Map<String, dynamic> json) {
    return Arac(id: json['id'], plaka: json['plaka'], tarih: json['tarih']);
  }
}
