import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deynekcidb/services/models/arac_model.dart';
import 'package:deynekcidb/services/models/kasa_model.dart';
import 'package:deynekcidb/services/models/ucretlendirme_model.dart';
import 'package:uuid/uuid.dart';

class FirebaseService {
  final araclarCol = FirebaseFirestore.instance.collection("araclar");
  final ucretCol = FirebaseFirestore.instance.collection("Ucretlendirme");
  final kasaCol = FirebaseFirestore.instance.collection("Kasa");
  final db = FirebaseFirestore.instance;

  postArac(Arac arac) {
    var uuid = const Uuid().v1();
    araclarCol
        .doc(uuid)
        .set({'id': uuid, 'plaka': arac.plaka, 'tarih': arac.tarih});
  }

  Future<List<Arac>> getAraclar() async {
    Iterable<Map<String, dynamic>> arabaDocs;
    var snapshot = await araclarCol.get();
    arabaDocs = snapshot.docs.map((e) => e.data());

    List<Arac> araclist = [];
    for (Map<String, dynamic> json in arabaDocs) {
      araclist.add(Arac.fromJson(json));
    }
    return araclist;
  }

  Future<Arac> getAracPlaka(String id) async {
    final arabaDoc =
        await araclarCol.doc(id).get().then((value) => value.data());
    final arabamodel = Arac.fromJson(arabaDoc!);
    return arabamodel;
  }

  Future<Ucretlendirme> getUcretlendirme(String id) async {
    final Map<String, dynamic>? ucretlendirmeDoc =
        await ucretCol.doc(id).get().then((value) => value.data());

    final ucretlendirmeModel =
        Ucretlendirme.fromJson(ucretlendirmeDoc as Map<String, dynamic>);
    return ucretlendirmeModel;
  }

  Future<Ucretlendirme> getOtopark(String id) async {
    final Map<String, dynamic>? ucretlendirmeDoc =
        await ucretCol.doc(id).get().then((value) => value.data());

    final ucretlendirmeModel =
        Ucretlendirme.fromJson(ucretlendirmeDoc as Map<String, dynamic>);
    return ucretlendirmeModel;
  }

  postKasa(Kasa kasa) {
    var uuid = const Uuid().v1();
    kasaCol.doc(uuid).set({
      'id': uuid,
      'alinan': kasa.alinan,
      'otopark_id': kasa.otoparkID,
      'tarih': kasa.tarih
    });
  }
}
