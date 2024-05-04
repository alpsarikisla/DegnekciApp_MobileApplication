import 'package:deynekcidb/firebase_options.dart';
import 'package:deynekcidb/screens/createpage.dart';
import 'package:deynekcidb/screens/homepage.dart';
import 'package:deynekcidb/screens/listpage.dart';
import 'package:deynekcidb/screens/beginpage.dart';
import 'package:deynekcidb/screens/detailpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    return MaterialApp(
      title: 'DeynekciApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange.shade900),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(title: "Deynekçi App"),
        "/begin": (context) => const BeginPage(title: "Deynekçi App"),
        "/aracekle": (context) => const CreatePage(title: "Araç Ekle"),
        "/listele": (context) => const ListPage(title: "Araç Listele"),
        "/detay": (context) => const DetailScreen(title: "Araç Detay"),
      },
    );
  }
}
