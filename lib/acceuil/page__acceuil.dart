
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wiso_cash/acceuil/index.dart';

class acceuil extends StatefulWidget {
  const acceuil({super.key});

  @override
  State<acceuil> createState() => _acceuilState();
}

class _acceuilState extends State<acceuil> {

  List elements =[
    const Plage_Accueil(),
    const historiques(),
    const Reglages()
  ];

  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 241, 241),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Container(
          height: 83,
          child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'images/Angara Pay-Bon.png',
                  ),
                ),
        ),
      centerTitle: true,
      ),
      body: Center(
        child: elements[current_index],
      ),

      //barre de navigation
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.3),
              offset: const Offset(0, -2),
              blurRadius: 20,
              spreadRadius: 2
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GNav(
            onTabChange: (index) {
              setState(() {
                current_index = index;
              });
            },
            padding: const EdgeInsets.all(7),
            selectedIndex: current_index,
            tabBackgroundColor: const Color.fromARGB(156, 157, 164, 224).withOpacity(.5),
            color: Colors.white,
            activeColor: Colors.white,
            gap: 9,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Accueil',
                iconSize: 20,
                ),
                GButton(
                icon: Icons.history_edu_outlined,
                iconSize: 20,
                text: 'Historiques',
                ),
                GButton(
                icon: Icons.settings,
                iconSize: 20,
                text: 'Réglages',
                )
            ],
          ),
        ),
      ),
    );
  }
}