import 'package:flutter/material.dart';

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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(onPressed: null, icon: Icon(Icons.share)),
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