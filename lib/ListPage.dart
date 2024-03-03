import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deynekcidb/NavBar.dart';
import 'package:deynekcidb/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
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
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      body: SingleChildScrollView(),
    );
  }
}
