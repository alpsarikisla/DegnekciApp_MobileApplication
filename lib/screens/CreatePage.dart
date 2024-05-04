import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deynekcidb/services/models/arac_model.dart';
import 'package:deynekcidb/services/firebase_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key, required this.title});
  final String title;
  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController t1 = TextEditingController();
  aracEkle() {
    try {
      FirebaseService().postArac(Arac(plaka: t1.text, tarih: Timestamp.now()));
      //_showToast(context);
      Fluttertoast.showToast(
        msg: '       Araç Eklendi       ',
        timeInSecForIosWeb: 3,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
      );
    } catch (e) {
      //_showErrorToast(context);
      Fluttertoast.showToast(
        msg: 'Araç Eklenirken Hata Oluştu',
        timeInSecForIosWeb: 3,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
      );
    }
    t1.text = "";
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    //Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
                      TextFormField(
                        controller: t1,
                        decoration: InputDecoration(
                            label: const Text("Plaka"),
                            hintText: '00 ABC 000',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.orange, width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(5),
                            )),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double
                            .infinity, // <-- match_parent// <-- match-parent)
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: aracEkle,
                            child: const Text(
                              "Araç Ekle",
                              style: TextStyle(fontSize: 20),
                            )),
                      )
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

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      const SnackBar(
        content: Text('Araç Eklendi'),
        //action: SnackBarAction(
        //label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _showErrorToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      const SnackBar(
        content: Text('Araç Eklenirken Hata Oluştu'),
        //action: SnackBarAction(
        //label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
