//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:deynekcidb/widgets/NavBar.dart';

import 'package:deynekcidb/services/models/firebase_service.dart';
import 'package:deynekcidb/services/models/arac_model.dart';
import 'package:deynekcidb/widgets/AracWidget.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key, required this.title});
  final String title;
  @override
  State<ListPage> createState() => _CreateListPage();
}

class _CreateListPage extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      //drawer: NavBar(),
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
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
                  return AracWidget(id: arac.id, plaka: arac.plaka);
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
