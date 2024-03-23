import 'package:deynekcidb/services/firebase_service.dart';
import 'package:deynekcidb/services/models/arac_model.dart';
import 'package:deynekcidb/widgets/aracwidget.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key, required this.title});
  final String title;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      //drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 15),
        ),
      ),
      //resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: FirebaseService().getAraclar(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              final List<Arac> araclar = snapshot.data!;
              return Column(
                children: List.generate(araclar.length, (index) {
                  final Arac arac = araclar[index];
                  return AracWidget(
                    id: arac.id,
                    plaka: arac.plaka,
                    tarih: arac.tarih,
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
