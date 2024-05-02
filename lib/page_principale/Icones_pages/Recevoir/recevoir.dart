import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class Recevoir extends StatefulWidget {
  const Recevoir({super.key});

  @override
  State<Recevoir> createState() => _RecevoirState();
}

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
                final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                if (image == null) return;

                await Share.shareXFiles([XFile('images/scan.jpg')], text: 'mon lien ici',);
              },
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