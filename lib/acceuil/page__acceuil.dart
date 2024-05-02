import 'package:flutter/material.dart';
import 'package:wiso_cash/acceuil/index.dart';

class acceuil extends StatefulWidget {
  const acceuil({super.key});

  @override
  State<acceuil> createState() => _acceuilState();
}

class _acceuilState extends State<acceuil> {
  List elements = [
    const Plage_Accueil(),
    const historiques(),
    const Reglages()
  ];

  int current_index = 0;
  final keyButtom = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    //double screen_width = MediaQuery.of(context).size.width;
    //double size_icones = screen_width * .065;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 241, 241),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Container(
          height: 83,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'images/logo.png',
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: PageView.builder(
          scrollBehavior: const ScrollBehavior(),
          controller: PageController(),
          itemCount: elements.length,
          itemBuilder: (context, index) {
            return elements[current_index];
          },
          onPageChanged: (index) {
            setState(() {
              if (current_index != index) current_index = index;
            });
          },
        ),
        //elements[current_index],
      ),

      //barre de navigation
      bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          selectedFontSize: 10,
          unselectedFontSize: 4,
          enableFeedback: true,
          showUnselectedLabels: false,
          currentIndex: current_index,
          selectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(color: Colors.white),
          backgroundColor: Theme.of(context).primaryColor,
          onTap: (index) {
            setState(() {
              current_index = index;
            });
          },
          items: [
            const BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
                label: 'Accueil'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  height: 40,
                  width: 40,
                  'images/historique.png',
                ),
                label: 'Historiques'),
            BottomNavigationBarItem(
                icon: Image.asset(height: 40, width: 40, 'images/reglage.png'),
                label: 'Réglages')
          ]),
    );
  }
}


//barre de navigation ..........................................................................................
// class Nav_bars extends StatefulWidget {
//   const Nav_bars({super.key});

//   @override
//   State<Nav_bars> createState() => _NavbarState();
// }

//   List elements2 =[
//     const Plage_Accueil(),
//     const historiques(),
//     const Reglages()
//   ];

//   int current_index2 = 0;

// class _NavbarState extends State<Nav_bars> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//           color: Theme.of(context).primaryColor,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(.3),
//               offset: const Offset(0, -2),
//               blurRadius: 20,
//               spreadRadius: 2
//             )
//           ]
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: GNav(
//             onTabChange: (index) {
//               setState(() {
//                 current_index2 = index;
//               });
//             },
//             padding: const EdgeInsets.all(7),
//             selectedIndex: current_index2,
//             tabBackgroundColor: const Color.fromARGB(156, 157, 164, 224).withOpacity(.5),
//             color: Colors.white,
//             activeColor: Colors.white,
//             gap: 9,
//             tabs: const [
//               GButton(
//                 icon: Icons.home,
//                 text: 'Accueil',
//                 iconSize: 20,
//                 ),
//                 GButton(
//                 icon: Icons.history_edu_outlined,
//                 iconSize: 20,
//                 text: 'Historiques',
//                 ),
//                 GButton(
//                 icon: Icons.settings,
//                 iconSize: 20,
//                 text: 'Réglages',
//                 )
//             ],
//           ),
//         ),
//       );
//   }
// }