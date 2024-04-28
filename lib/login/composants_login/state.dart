import 'package:flutter/material.dart';

class Entete_state extends StatelessWidget {
  final String text;
  const Entete_state({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return Column(
      children: [

        //Entête image logo
        Container(
            height: screen_height * .25,
            width: screen_width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Image.asset(
                'images/Angara Pay-Bon.png',
              ),
            )),

        //Sizebox
        const SizedBox(
          height: 20,
        ),

        //Se connecter
        Text(
          text,
          style: TextStyle(
              color: Theme.of(context).primaryColor, fontSize: 30, fontWeight: FontWeight.bold),
        ),

        //Sizebox
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
