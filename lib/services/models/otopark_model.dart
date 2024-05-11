class Otopark {
  final num kapasite;
  final String id, isim, kullaniciadi, sehir, sifre;
  final bool durum;

  Otopark(
      {this.kapasite = 0,
      this.id = "-/-",
      this.isim = "",
      this.kullaniciadi = "",
      this.sifre = "",
      this.sehir = "",
      this.durum = true});

  factory Otopark.fromJson(Map<String, dynamic> json) {
    num kapasite = json["kapasite"];
    String id = json["id"];
    String isim = json["isim"];
    String kullaniciadi = json["kullaniciadi"];
    String sehir = json["sehir"];
    String sifre = json["sifre"];
    bool durum = json["durum"];

    return Otopark(
        kapasite: kapasite,
        id: id,
        isim: isim,
        kullaniciadi: kullaniciadi,
        sehir: sehir,
        sifre: sifre,
        durum: durum);
  }
}
