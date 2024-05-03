import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Reglages extends StatefulWidget {
  const Reglages({super.key});

  @override
  State<Reglages> createState() => _ReglagesState();
}

class _ReglagesState extends State<Reglages> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //titre Reglages
          Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(.1),
              ),
              child: Text(
                'Réglages',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              )),

          //sizebox
          const SizedBox(
            height: 30,
          ),

          //se déconnecter
          TextButton(
              onPressed: () {},
              child: Text('Se déconnecter',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor.withOpacity(.6),
                  ))),

          //divider
          const Divider(),

          //sizebox
          const SizedBox(
            height: 10,
          ),

          //partager l'application
          GestureDetector(
            onTap: () {
              Share.share('com.example.wiso_cash');
            },
            child: const ListTile(
              leading:  Icon(Icons.share),
              title: Text('Partager l\'application'),
            ),
          ),

          //Nous contacter
          GestureDetector(
            onTap: () async {
              final Uri url = Uri(
                scheme: 'tel',
                path: '+237692494794',
              );
              if(await canLaunchUrl(url)){
                await launchUrl(url);
              }else{
                print('cannot launch this tel');
              }
              
            },
            child: const ListTile(
              leading: Icon(Icons.call),
              title: Text('Nous contacter'),
            ),
          ),

          //Renseignez-vous sur nous
          GestureDetector(
            onTap: () {
              
            },
            child: const ListTile(
              leading: Icon(Icons.list),
              title: Text('A propos de nous'),
            ),
          )
        ],
      ),
    );
  }
}
