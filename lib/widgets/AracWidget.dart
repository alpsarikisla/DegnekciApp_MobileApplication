import 'package:flutter/material.dart';
import 'package:deynekcidb/screens/detail_screen.dart';

class AracWidget extends StatelessWidget {
  final id;
  final plaka;
  const AracWidget({super.key, required this.id, required this.plaka});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: InkWell(
        onTap: () =>
            Navigator.of(context).pushNamed("/detail", arguments: (id)),
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: Colors.white,
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
