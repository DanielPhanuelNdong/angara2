import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiso_cash/acceuil/Navigations/PagesIcones/composant_payer/index.dart';
import 'package:wiso_cash/acceuil/index.dart';

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
    double icontaille = 35;
    double taille = 70;
    return Column(
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
                        blurRadius: 4,
                        spreadRadius: 2,
                        offset: const Offset(0, 2),
                      )
                    ]),
              ),
            ),

            //Profil
            const Padding(
              padding: EdgeInsets.only(top: 30, left: 10, bottom: 0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  
                ),
                title: Text(
                  'Mon nom est ici',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                subtitle: Text(
                  '837847485743',
                  style: TextStyle(color: Color.fromARGB(255, 240, 239, 239)),
                ),
              ),
            ),

            //compte principal et solde
            const Positioned(
              top: 115,
              left: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Compte Principal',
                    style: TextStyle(
                      fontSize: 14,
                      //fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    'Solde',
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

        const SizedBox(
          height: 15,
        ),

        //sizebox
        const SizedBox(
          height: 20,
        ),

        //les differents icones
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              //Envoyer
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(() => const Elements_Icones());
                    },
                    child: Container(
                      height: taille,
                      width: taille,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromRGBO(17, 17, 19, 100)
                            .withOpacity(.99),
                      ),
                      child: Image.asset(
                        height: icontaille,
                        width: icontaille,
                        'images/envoyer.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Envoyer\n ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),

              //sizebox
              const SizedBox(
                width: 20,
              ),

              //Payer
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const Scanner_code());
                    },
                    child: Container(
                      height: taille,
                      width: taille,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromRGBO(17, 17, 19, 100)
                            .withOpacity(.99),
                      ),
                      child: Image.asset(
                        height: icontaille,
                        width: icontaille,
                        'images/payment.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Payer\n ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),

              //sizebox
              const SizedBox(
                width: 20,
              ),

              //Recharger
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(() => const Elements_icones2());
                    },
                    child: Container(
                      height: taille,
                      width: taille,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromRGBO(17, 17, 19, 100)
                            .withOpacity(.99),
                      ),
                      child: Image.asset(
                        height: icontaille,
                        width: icontaille,
                        'images/recharger.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Recharger\n ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),

              //sizebox
              const SizedBox(
                width: 20,
              ),

              //Recevoir
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const Recevoir());
                    },
                    child: Container(
                      height: taille,
                      width: taille,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromRGBO(17, 17, 19, 100)
                            .withOpacity(.99),
                      ),
                      child: Image.asset(
                        height: icontaille,
                        width: icontaille,
                        'images/scan.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    'Recevoir\npaiement',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 30,
        ),

        //ligne 2 des services
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              //paiements factures
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const Paiement_facture());
                    },
                    child: Container(
                      height: taille,
                      width: taille,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromRGBO(17, 17, 19, 100)
                            .withOpacity(.99),
                      ),
                      child: Image.asset(
                        height: icontaille,
                        width: icontaille,
                        'images/send2.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Paiement\n factures',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),

              //sizebox
              const SizedBox(
                width: 40,
              ),

              //recharges unités
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const recharge_unites());
                    },
                    child: Container(
                      height: taille,
                      width: taille,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromRGBO(17, 17, 19, 100)
                            .withOpacity(.99),
                      ),
                      child: Image.asset(
                        height: icontaille,
                        width: icontaille,
                        'images/payment.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Recharges\n Unités',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),

              //sizebox
              const SizedBox(
                width: 30,
              ),

              //transferts internationaux
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(() => const Transfert_internationaux());
                    },
                    child: Container(
                      height: taille,
                      width: taille,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromRGBO(17, 17, 19, 100)
                            .withOpacity(.99),
                      ),
                      child: Image.asset(
                        height: icontaille,
                        width: icontaille,
                        'images/recharge.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //sizedbox
                  const SizedBox(
                    height: 10,
                  ),

                  //texte
                  const Text(
                    'Transferts\n Internationaux',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),

              
            ],
          ),
        ),

      ],
    );
  }
}
