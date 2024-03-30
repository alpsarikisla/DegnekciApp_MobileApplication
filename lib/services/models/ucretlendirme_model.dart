import 'package:cloud_firestore/cloud_firestore.dart';

class Ucretlendirme {
  final num girisucret, saatlikucret;
  final String otoparkid, id;

  Ucretlendirme(
      {this.girisucret = 0,
      this.id = "-/-",
      this.otoparkid = "-/-",
      this.saatlikucret = 0});

  factory Ucretlendirme.emptyUcretlendirme() {
    return Ucretlendirme();
  }

  factory Ucretlendirme.fromJson(Map<String, dynamic> json) {
    num girisucret = json["giris"];
    String id = json["id"];
    String otoparkid = json["otopark_id"];
    num saatlikucret = json["saatbasi"];

    return Ucretlendirme(
        girisucret: girisucret,
        id: id,
        otoparkid: otoparkid,
        saatlikucret: saatlikucret);
  }
  factory Ucretlendirme.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Ucretlendirme(
      girisucret: data?['giris'],
      saatlikucret: data?['saatbasi'],
      otoparkid: data?['otopark_id'],
      id: data?['id'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (girisucret != null) "giris": girisucret,
      if (saatlikucret != null) "saatbasi": saatlikucret,
      if (otoparkid != null) "otopark_id": otoparkid,
      if (id != null) "id": id,
    };
  }
}
