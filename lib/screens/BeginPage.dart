import 'package:flutter/material.dart';

class BeginPage extends StatelessWidget {
  const BeginPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      backgroundColor: Colors.black12,
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
                              child: Image.asset("images/degnekci.jpeg"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      )),
    );
  }
}
