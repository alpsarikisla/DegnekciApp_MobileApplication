import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AracWidget extends StatelessWidget {
  final String id;
  final String plaka;
  final Timestamp tarih;
  const AracWidget(
      {super.key, required this.id, required this.plaka, required this.tarih});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed("/detay", arguments: (id, plaka, tarih)),
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(3),
              border: const Border(
                  bottom: BorderSide(width: 2, color: Colors.black38))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(plaka,
                  style: const TextStyle(fontSize: 16, color: Colors.black))
            ],
          ),
        ),
      ),
    );
  }
}
