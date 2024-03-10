import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.title});
  final String title;
  @override
  State<DetailScreen> createState() => _CreateActionScreen();
}

class _CreateActionScreen extends State<DetailScreen> {
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
      body: null,
    );
  }
}
