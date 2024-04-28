import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deynekcidb/services/firebase_service.dart';
import 'package:deynekcidb/services/models/ucretlendirme_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.title});
  final String title;
  @override
  State<DetailScreen> createState() => _CreateActionScreen();
}

class _CreateActionScreen extends State<DetailScreen> {
  Ucretlendirme? ucretlendirme;
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

    DateTime suan = DateTime.now();
    DateTime giris = DateTime.parse(tarih.toDate().toString());
    int saat = suan.difference(giris).inHours;
    String saatmesaj = "${saat.toString()} saat oldu";
    String tarihStr =
        "${tarih.toDate().day.toString()}/${tarih.toDate().month.toString()}/${tarih.toDate().year.toString()} ${tarih.toDate().hour.toString()}:${tarih.toDate().minute.toString()}";

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
                      const SizedBox(height: 20),
                      Text(plaka),
                      //Text(tarih.toDate().add(const Duration(hours: 3)).toString()),
                      Text(tarihStr),
                      const SizedBox(height: 20),
                      Text(saatmesaj),
                      const SizedBox(height: 20),
                      Text((ucretlendirme == null
                          ? ""
                          : ucretlendirme!.girisucret.toString())),
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
