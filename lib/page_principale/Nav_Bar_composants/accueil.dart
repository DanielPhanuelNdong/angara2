import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiso_cash/page_principale/index.dart';

class Plage_Accueil extends StatefulWidget {
  const Plage_Accueil({super.key});

  @override
  State<Plage_Accueil> createState() => _Plage_AccueilState();
}

class _Plage_AccueilState extends State<Plage_Accueil> {
  @override
  Widget build(BuildContext context) {
    
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    double icontaille = screen_width * .18;
    double espace_icones = screen_width * .05;
    double espace_icones2 = screen_width * .035;


    String titles = 'Anita Testerman';


    //double taille = screen_width*.14;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              //container d'entête
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: screen_height * .23,
                  width: screen_width,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.2),
                          blurRadius: screen_width * .02,
                          spreadRadius: screen_width * .01,
                          offset: const Offset(0, 2),
                        )
                      ]),
                ),
              ),

              //Profil
              Padding(
                padding: EdgeInsets.only(
                    top: screen_height * .04, left: screen_width * .04),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Text(
                      titles[0].toUpperCase(),
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    titles,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  subtitle: const Text(
                    '+237837847485743',
                    style: TextStyle(color: Color.fromARGB(255, 240, 239, 239)),
                  ),
                ),
              ),

              //compte principal et solde
              Positioned(
                top: screen_height * .16,
                left: screen_width * .1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Solde :',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: screen_width * .3,
                    ),
                    const Text(
                      '100000.00 XAF',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          //sizedbox
          SizedBox(
            height: screen_height * .031,
          ),

          //les differentes icones
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Envoyer
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const Elements_Icones());
                      },
                      child: Image.asset(
                        height: icontaille,
                        width: icontaille,
                        'images/envoyer.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: screen_height * .0001,
                    ),
                    const Text(
                      'Envoyer\n ',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),

                //sizebox
                SizedBox(
                  width: espace_icones,
                ),

                //Payer
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const Scanner_code());
                      },
                      child: Image.asset(
                        height: icontaille,
                        width: icontaille,
                        'images/payer.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: screen_height * .0001,
                    ),
                    const Text(
                      'Payer\n ',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),

                //sizebox
                SizedBox(
                  width: espace_icones,
                ),

                //Recharger
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const Elements_icones2());
                      },
                      child: Image.asset(
                        height: icontaille,
                        width: icontaille,
                        'images/recharger.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: screen_height * .0001,
                    ),
                    const Text(
                      'Recharger\n ',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),

                //sizebox
                SizedBox(
                  width: espace_icones,
                ),

                //Retrait
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const retrait());
                      },
                      child: Image.asset(
                        height: icontaille,
                        width: icontaille,
                        'images/retrait.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: screen_height * .0001,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'Retrait\n',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),

          //sizedbox
          SizedBox(
            height: screen_height * .04,
          ),

          //ligne 2 des services
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Recevoir
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const Recevoir());
                      },
                      child: Image.asset(
                        height: icontaille,
                        width: icontaille,
                        'images/recevoir.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: screen_height * .0001,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'Recevoir\n Paiement',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),

                //sizebox
                SizedBox(
                  width: espace_icones2,
                ),

                //paiements factures
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const Paiement_facture());
                      },
                      child: Image.asset(
                        height: icontaille,
                        width: icontaille,
                        'images/paiementFactures.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: screen_height * .0001,
                    ),
                    const Text(
                      'Paiement\n factures',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),

                //sizebox
                SizedBox(
                  width: espace_icones2,
                ),

                //recharges unités
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const recharge_unites());
                      },
                      child: Image.asset(
                        height: icontaille,
                        width: icontaille,
                        'images/rechargeUnités.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: screen_height * .0001,
                    ),
                    const Text(
                      'Recharges\n Unités',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),

                //sizebox
                SizedBox(
                  width: espace_icones2,
                ),

                //transferts internationaux
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const Transfert_internationaux());
                      },
                      child: Image.asset(
                        height: icontaille,
                        width: icontaille,
                        'images/transfertsInternationaux.png',
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(
                      height: screen_height * .0001,
                    ),

                    //texte
                    const Text(
                      'Transferts\n Internationaux',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
