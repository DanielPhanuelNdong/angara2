import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class Scanner_code extends StatefulWidget {
  const Scanner_code({super.key});

  @override
  State<Scanner_code> createState() => _Scanner_codeState();
}

final keyform = GlobalKey<FormState>();
String _BarcodeResult = '';

class _Scanner_codeState extends State<Scanner_code> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scanner',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: keyform,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //Entrez le lien
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                cursorColor: Theme.of(context).primaryColor,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  focusColor: Theme.of(context).primaryColor,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  )),
                  labelText: 'Entrez le lien',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer un lien correct';
                  } else {
                    return null;
                  }
                },
              ),
            ),

            //sizedbox
            const SizedBox(
              height: 50,
            ),

            //bouton pour scanner
            InkWell(
              onTap: () {
                if (keyform.currentState!.validate()) {
                  QRCodeScan();
                }
              },
              child:
                  Container(
                height: 60,
                width: screen_width * .88,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColor,
                        blurRadius: 2,
                        offset: const Offset(0, 4),
                        spreadRadius: 1,
                      )
                    ]),
                child: const Text(
                  'Scanner',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),

            //sizedbox
            const SizedBox(
              height: 40,
            ),

            //texte
            Text(
              textAlign: TextAlign.center,
              'Le code QR scanner est : $_BarcodeResult', style: const TextStyle(fontSize: 20,),),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void QRCodeScan() async {
    String QRCode;
    try{

      QRCode= await FlutterBarcodeScanner.scanBarcode(

      "#ff6666", // Scan line color
      "Cancel", // Cancel button text
      true,// Whether to use the rear camera
      ScanMode.QR
    );
    } on PlatformException {
      QRCode = 'Echec PlatformException';
    }

    setState(() {
      _BarcodeResult = QRCode;
    });
    
  }
}
