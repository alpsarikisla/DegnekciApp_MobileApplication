class Ucretlendirme {
  final num girisucret, saatlikucret;
  final String otoparkid, id;

  Ucretlendirme(
      {this.girisucret = 0,
      this.id = "-/-",
      this.otoparkid = "-/-",
      this.saatlikucret = 0});

  factory Ucretlendirme.fromJson(Map<String, dynamic> json) {
    num girisucret = json["giris"];
    String otoparkid = json["otopark_id"];
    num saatlikucret = json["saatbasi"];

    return Ucretlendirme(
        girisucret: girisucret,
        otoparkid: otoparkid,
        saatlikucret: saatlikucret);
  }
}
