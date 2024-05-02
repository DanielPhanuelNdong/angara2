import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wiso_cash/acceuil/Navigations/accueil.dart';
import 'package:wiso_cash/acceuil/Navigations/historiques.dart';
import 'package:wiso_cash/acceuil/Navigations/reglages.dart';

class Barre_navigation extends StatefulWidget {
  const Barre_navigation({super.key});

  @override
  State<Barre_navigation> createState() => _Barre_navigationState();
}
final keyButtom = GlobalKey<NavigatorState>();

List elements = [
    const Plage_Accueil(),
    const historiques(),
    const Reglages()
  ];

int current_index = 0;

class _Barre_navigationState extends State<Barre_navigation> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double size_icones = screen_width * .065;
    return Container(
        decoration:
            BoxDecoration(color: Theme.of(context).primaryColor, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.3),
              offset: const Offset(0, -2),
              blurRadius: screen_width * .05,
              spreadRadius: screen_width * .01,
              )
        ]),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GNav(
            key: keyButtom,
            onTabChange: (index) {
              setState(() {
                current_index = index;
                elements[current_index];
              });
            },
            padding: const EdgeInsets.all(7),
            selectedIndex: current_index,
            tabBackgroundColor:
                const Color.fromARGB(156, 157, 164, 224).withOpacity(.5),
            color: Colors.white,
            activeColor: Colors.white,
            gap: 9,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Accueil',
                iconSize: size_icones,
              ),
              GButton(
                icon: Icons.history_edu_outlined,
                iconSize: size_icones,
                text: 'Historiques',
              ),
              GButton(
                icon: Icons.settings,
                iconSize: size_icones,
                text: 'Réglages',
              )
            ],
          ),
        ),
      );
  }
}