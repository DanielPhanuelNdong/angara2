import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class Recevoir extends StatefulWidget {
  const Recevoir({super.key});

  @override
  State<Recevoir> createState() => _RecevoirState();
}

String texte = 'https://www.youtube.com/watch?v=Gy1by7rKdME';
String Image_Scan = 'images/scan.jpg';

class _RecevoirState extends State<Recevoir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recevoir un paiement', style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () async {
                //Share.share(texte);
                final image = await rootBundle.load(Image_Scan);
                final buffer = image.buffer;

                await Share.shareXFiles([
                  XFile.fromData(
                    buffer.asUint8List(
                      image.offsetInBytes,
                      image.lengthInBytes,
                    ),
                    name: 'QR Code',
                    mimeType: 'jpg'
                  ),
                  
                ],
                subject: 'QR Code'

                );
              },
              // async {
              //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                
              //   if (image == null) return;

              //   await Share.shareXFiles([XFile('images/scan.jpg')], text: 'mon lien ici',);
              // },
              icon: const Icon(Icons.share)),
          )
        ],
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('images/scan.jpg', fit: BoxFit.cover,),
          )
        ],
      ),
    );
  }
}