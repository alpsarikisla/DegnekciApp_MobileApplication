class Arac {
  final String id;
  final String plaka;
  Arac({this.id = "", required this.plaka});

  factory Arac.fromJson(Map<String, dynamic> json) {
    return Arac(id: json['id'], plaka: json['plaka']);
  }
}
