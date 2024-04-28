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
}
