import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deynekcidb/services/firebase_service.dart';
import 'package:deynekcidb/services/models/kasa_model.dart';
import 'package:deynekcidb/services/models/ucretlendirme_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.title});
  final String title;
  @override
  State<DetailScreen> createState() => _CreateActionScreen();
}

class _CreateActionScreen extends State<DetailScreen> {
  Ucretlendirme? ucretlendirme;
  aracCikis(String id, num alinan) {
    try {
      FirebaseService().postKasa(Kasa(
          alinan: alinan,
          otoparkID: "IwswahHDzhWPYtEKTnU7",
          tarih: Timestamp.now()));
      Fluttertoast.showToast(
        msg: '       Tahsilat Alındı        ',
        timeInSecForIosWeb: 3,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
      );
      FirebaseFirestore.instance.collection("araclar").doc(id).delete();
      Navigator.of(context).pushNamed('/listele');
    } catch (e) {
      //_showErrorToast(context);
      Fluttertoast.showToast(
        msg: 'Tahsilat Alınırken Hata Oluştu',
        timeInSecForIosWeb: 3,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
      );
    }
  }

  aracSil(String id) {
    FirebaseFirestore.instance.collection("araclar").doc(id).delete().then(
          (doc) => Fluttertoast.showToast(
            msg: '       İptal Edildi       ',
            timeInSecForIosWeb: 3,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.green,
          ),
          onError: (e) => Fluttertoast.showToast(
            msg: '        Hata Oluştu        ',
            timeInSecForIosWeb: 3,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
          ),
        );
    //Navigator.pop(context, true);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    FirebaseService()
        .getUcretlendirme("1CyUClfZ0sGtwLJsh4on")
        .then((ucretlendirme) {
      this.ucretlendirme = ucretlendirme;
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    final (id, plaka, tarih) = ModalRoute.of(context)!.settings.arguments as (
      String,
      String,
      Timestamp
    );
    if (ucretlendirme == null) {
      return const CircularProgressIndicator();
    }

    DateTime suan = DateTime.now();
    DateTime giris = DateTime.parse(tarih.toDate().toString());
    int saat = suan.difference(giris).inHours;
    String saatmesaj = "${saat.toString()} saat oldu";
    String tarihStr =
        "${tarih.toDate().day.toString()}/${tarih.toDate().month.toString()}/${tarih.toDate().year.toString()} ${tarih.toDate().add(const Duration(hours: 3)).hour.toString()}:${tarih.toDate().minute.toString()}";
    num toplam =
        ucretlendirme!.girisucret + (ucretlendirme!.saatlikucret * saat);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 15),
        ),
      ),
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Card(
                        elevation: 10,
                        //color: Colors.orange,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset("images/AracEkle.png"),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(tarihStr, style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 10),
                      Text(saatmesaj, style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 10),
                      Text(plaka, style: const TextStyle(fontSize: 40)),
                      const SizedBox(height: 10),
                      Text(id, style: const TextStyle(fontSize: 10)),
                      const SizedBox(height: 20),
                      Text(
                        (ucretlendirme == null
                            ? ""
                            : toplam.toString() + ",00 ₺"),
                        style: const TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: double
                            .infinity, // <-- match_parent// <-- match-parent)
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white),
                            onPressed: () => aracCikis(id, toplam),
                            child: const Text("Araç Çıkış",
                                style: TextStyle(fontSize: 20))),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                foregroundColor: Colors.white),
                            onPressed: () => aracSil(id),
                            child: const Text("İptal",
                                style: TextStyle(fontSize: 20))),
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
