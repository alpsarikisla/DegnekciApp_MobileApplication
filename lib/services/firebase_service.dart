import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deynekcidb/services/models/arac_model.dart';
import 'package:deynekcidb/services/models/ucretlendirme_model.dart';
import 'package:uuid/uuid.dart';

class FirebaseService {
  final araclarCol = FirebaseFirestore.instance.collection("araclar");
  final ucretCol = FirebaseFirestore.instance.collection("Ucretlendirme");
  final db = FirebaseFirestore.instance;

  postArac(Arac arac) {
    var uuid = const Uuid();
    araclarCol
        .doc()
        .set({'id': uuid.v1(), 'plaka': arac.plaka, 'tarih': arac.tarih});
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
    final ref = db.collection("Ucretlendirme").doc(id).withConverter(
          fromFirestore: Ucretlendirme.fromFirestore,
          toFirestore: (Ucretlendirme ucretlendirme, _) =>
              ucretlendirme.toFirestore(),
        );
    final docSnap = await ref.get();
    final ucretlendirme = docSnap.data(); // Convert to City object
    return ucretlendirme!;
  }
}
