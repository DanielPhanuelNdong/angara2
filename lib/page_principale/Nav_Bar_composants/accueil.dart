import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_bloc.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_event.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_state.dart';
import 'package:wiso_cash/page_principale/index.dart';

class Plage_Accueil extends StatefulWidget {
  const Plage_Accueil({super.key});

  @override
  State<Plage_Accueil> createState() => _Plage_AccueilState();
}

class _Plage_AccueilState extends State<Plage_Accueil> {
  String? nomsutilis = '';
  String? prenomsutilis = '';
  String? intitulewallet = '';
  String? codewallet = '';
  String? solde = '';
  //String? monSolde = '';
  String? NewSolde = '';
  String? monSolde = Get.arguments;

  final Map<String, String> data = {
    'codeserv': 'consulterunwallet',
    'codewallet': '',
  };

  String url = "iwallet.php";
  @override
  void initState() {
    super.initState();
    loadCodeconn();
    _triggerBlocEvent();
  }

  Future<void> loadCodeconn() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nomsutilis = prefs.getString('nomsutilis');
      prenomsutilis = prefs.getString('prenomsutilis');
      intitulewallet = prefs.getString('intitulewallet');
      codewallet = prefs.getString('codewallet');
      data['codewallet'] = codewallet ?? '';
      //monSolde = prefs.getString('soldewallet');
    });
  }

  void _triggerBlocEvent() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BlocBloc>().add(registerDataEvent(data: data, url: url));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    double icontaille = screen_width * .18;
    double espace_icones = screen_width * .05;
    double espace_icones2 = screen_width * .08;

    String? titles = '${nomsutilis ?? ''} ${prenomsutilis ?? ''}';

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
                  height: screen_height * .28,
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
                  subtitle: Text(
                    intitulewallet ?? 'R.A.S',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 240, 239, 239)),
                  ),
                ),
              ),

              //compte principal et solde
              Positioned(
                top: screen_height * .17,
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
                      width: screen_width * .06,
                    ),
                    BlocListener<BlocBloc, BlocState>(
                      listener: (context, state) async {
                        if (state is RegisterLoadingState) {
                          const CircularProgressIndicator();
                        }
                        // Vérifiez si le `state` est `RegisterSuccessState` et que `register` n'est pas null
                        if (state is WebSocketMessageReceivedState) {
                          final prefs = await SharedPreferences.getInstance();

                          print(
                              'je suis à L\'ecoute;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;');
                          final message = state.message;
                          NewSolde = message?.body.transaction.nouveausolde;
                          final nouveausolde =
                              message?.body.transaction.nouveausolde;
                          await prefs.setString('nouveausolde', nouveausolde!);

                          setState(() {
                            monSolde = prefs.getString('nouveausolde');
                            solde = prefs.getString('nouveausolde');
                          });
                          print(message);

                          // Affichez le texte basé sur la valeur de `message.head`
                          message != null && message.head == false
                              ? solde = monSolde
                              : solde = message?.body.transaction.nouveausolde;
                        }

                        if (state is RegisterSuccessState) {
                          solde = state.register?.body?.soldewallet;
                        }
                      },
                      child: BlocBuilder<BlocBloc, BlocState>(
                        builder: (context, state) {
                          // Retourne un texte par défaut si le `state` n'est ni `RegisterLoadingState` ni `RegisterSuccessState`
                          return solde == ''
                              ? const CircularProgressIndicator()
                              : Text(
                                  solde ?? 'RAS#',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                        },
                      ),
                    ),
                    SizedBox(
                      width: screen_width * .1,
                    ),
                  ],
                ),
              ),

              //Recevoir
              Positioned(
                top: screen_height * .12,
                left: screen_width * .75,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const Recevoir());
                  },
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        height: icontaille,
                        width: icontaille,
                        'images/qrcode.png',
                        fit: BoxFit.cover,
                      ),

                      // SizedBox(
                      //   height: screen_height * .0001,
                      // ),
                      const Text(
                        textAlign: TextAlign.center,
                        'Recevoir\n Paiement',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          //sizedbox
          SizedBox(
            height: screen_height * .05,
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
