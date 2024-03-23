import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:deynekcidb/screens/BeginPage.dart';
import 'package:deynekcidb/screens/CreatePage.dart';
import 'package:deynekcidb/screens/ListPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 1;
  List<Widget> pages = [
    const CreatePage(title: "Araç Ekle"),
    const BeginPage(title: "Ana Sayfa"),
    const ListPage(title: "Araçlar Listesi"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.orange.shade900,
        title: Text(
          widget.title,
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      //resizeToAvoidBottomInset: false,
      body: pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black12,
        index: _currentIndex,
        items: const <Widget>[
          Icon(Icons.add_road, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.list_alt, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
