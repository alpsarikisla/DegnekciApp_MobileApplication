import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deynekcidb/services/models/arac_model.dart';
import 'package:uuid/uuid.dart';

class FirebaseService {
  final araclarCol = FirebaseFirestore.instance.collection("araclar");

  postArac(Arac arac) {
    var uuid = const Uuid();
    araclarCol
        .doc()
        .set({'id': uuid.v1(), 'plaka': arac.plaka, 'tarih': DateTime.now()});
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
}
