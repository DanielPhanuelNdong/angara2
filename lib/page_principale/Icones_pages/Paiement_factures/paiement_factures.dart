import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiso_cash/page_principale/Nav_Bar_composants/Nav_Bar.dart';

class Paiement_facture extends StatefulWidget {
  const Paiement_facture({super.key});

  @override
  State<Paiement_facture> createState() => _Paiement_factureState();
}

final List<String> Element_paiement = ['Electricité', 'Eau', 'TV', 'Camtel'];

final formKey2 = GlobalKey<FormState>();
//IconData vises = Icons.visibility_off;
//bool _obscure = true;

String current_options = Element_paiement[0];

class _Paiement_factureState extends State<Paiement_facture> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;

    var children = [
      const SizedBox(
        height: 60,
      ),

      //modes utilisés
      Column(
        children: Element_paiement.map((item) {
          return RadioListTile(
            value: item,
            groupValue: current_options,
            onChanged: (Value) {
              setState(() {
                current_options = Value!;
              });
            },
            title: Text(
              item,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            activeColor: Theme.of(context).primaryColor,
          );
        }).toList(),
      ),

      const SizedBox(
        height: 40,
      ),

      //form
      Form(
        key: formKey2,
        child: Column(
          children: [
            //Entrer le numero de la facture
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                cursorColor: Theme.of(context).primaryColor,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  focusColor: Theme.of(context).primaryColor,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  )),
                  labelText: 'Entrez le numéro de facture',
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z 0-9]{4,15}$').hasMatch(value)) {
                    return 'Veuillez entrer un numero correct';
                  } else {
                    return null;
                  }
                },
              ),
            ),

            //sizedbox
            const SizedBox(
              height: 70,
            ),

            //bouton de confirmation
            InkWell(
              onTap: () {
                if (formKey2.currentState!.validate()) {
                  //boite de dialogue pour la confirmation de paiement d'eau, électricité etc.
                  showDialog(
                    barrierColor:
                        Theme.of(context).primaryColor.withOpacity(.2),
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text(
                        'Voulez-vous vraiment payer pour $current_options ??',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      content: Container(
                        alignment: Alignment.center,
                        height: 20,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Get.offAll(() => const mode_paiement_facture(),
                                transition: Transition.fade,
                                duration: const Duration(seconds: 1));
                          },
                          child: Text(
                            'Valider',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            'Annuler',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
              child:

                  //confirmation
                  Container(
                height: 42,
                width: screen_width * .88,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColor,
                        blurRadius: 2,
                        offset: const Offset(0, 4),
                        spreadRadius: 1,
                      )
                    ]),
                child: const Text(
                  'Confirmer',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payez vos factures',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.offAll(() => const acceuil());
              setState(() {
                current_options = Element_paiement[0];
              });
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: children,
        ),
      ),
    );
  }
}

//Mode de paiement des factures ..............................................................................

class mode_paiement_facture extends StatefulWidget {
  const mode_paiement_facture({super.key});

  @override
  State<mode_paiement_facture> createState() => _mode_paiement_factureState();
}

TextEditingController controle22 = TextEditingController();
TextEditingController controles22 = TextEditingController();
//String control2 = controle.text;

final List<String> mode_transfert22 = [
  'Mobile Money',
  'Wiso Cash',
  'Mobile Wallet'
];

final formKey23 = GlobalKey<FormState>();
final formKey22 = GlobalKey<FormState>();
IconData vise = Icons.visibility_off;
//bool _obscure = true;

String current_option22 = mode_transfert22[0];

class _mode_paiement_factureState extends State<mode_paiement_facture> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;

    var children = [
      //sizebox
      SizedBox(
        height: screen_height * .15,
      ),


      //modes utilisés
      Container(
        height: 100,
        width: screen_width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.03),
        ),
        child: Row(
          children: mode_transfert22.map((item) {
            return Expanded(
              child: RadioListTile(
                value: item,
                groupValue: current_option22,
                onChanged: (Value) {
                  setState(() {
                    current_option22 = Value!;
                  });
                },
                title: Text(
                  item,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                activeColor: Theme.of(context).primaryColor,
              ),
            );
          }).toList(),
        ),
      ),

      //sizebox
      const SizedBox(
        height: 10,
      ),

      //form
      Form(
        key: formKey23,
        child: Column(
          children: [
            //Entrer le numero
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: controles22,
                cursorColor: Theme.of(context).primaryColor,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  focusColor: Theme.of(context).primaryColor,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  )),
                  labelText: 'Entrez le numéro',
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\S\./0-9]+$')
                          .hasMatch(value)) {
                    return 'Veuillez entrer un numero correct';
                  } else {
                    return null;
                  }
                },
              ),
            ),

            //sizebox
            const SizedBox(
              height: 30,
            ),

            //Entrer le montant
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: controle22,
                cursorColor: Theme.of(context).primaryColor,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  focusColor: Theme.of(context).primaryColor,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  )),
                  labelText: 'Entrez le montant',
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[0-9]{4,10}$').hasMatch(value)) {
                    return 'Veuillez entrer un montant correct';
                  } else {
                    return null;
                  }
                },
              ),
            ),

            //sizebox
            const SizedBox(
              height: 70,
            ),

            //bouton de confirmation
            InkWell(
              onTap: () {
                if (formKey23.currentState!.validate()) {
                  showDialog(
                    barrierColor:
                        Theme.of(context).primaryColor.withOpacity(.2),
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text(
                        'Veuillez Confirmer',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      content: Form(
                        key: formKey22,
                        child: Container(
                          alignment: Alignment.center,
                          height: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //textes de confirmation
                              Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  'Vous ête sur le point d\'éffectuer un paiement de facture de ' +
                                      controle22.text +
                                      ' au numéro ' +
                                      controles22.text,
                                  style: const TextStyle(color: Colors.black),),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                  'Saisissez votre code PIN pour valider',
                                  style: TextStyle(color: Colors.black),),

                              //sizebox
                              const SizedBox(
                                height: 30,
                              ),

                              //Entrer le code PIN
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                                    focusColor: Theme.of(context).primaryColor,
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                    )),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                    )),
                                    labelText: 'Entez votre Code PIN',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[0-9]{5}$')
                                            .hasMatch(value)) {
                                      return 'Entrer un code correct';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            if (formKey22.currentState!.validate()) {
                              Get.offAll(() => const acceuil(),
                                  transition: Transition.fade,
                                  duration: const Duration(seconds: 1));
                              setState(() {
                                controle22.text = '';
                                controles22.text = '';
                                current_option22 = mode_transfert22[0];
                              });
                            }
                          },
                          child: Text(
                            'Valider',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            'Annuler',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                  // Get.offAll(() => const acceuil(),
                  // transition: Transition.size,
                  // duration: Durations.medium2,
                  // );
                }
              },
              child: Container(
                height: 42,
                width: screen_width * .88,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColor,
                        blurRadius: 2,
                        offset: const Offset(0, 4),
                        spreadRadius: 1,
                      )
                    ]),
                child: const Text(
                  'Confirmer',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mode de paiement',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              setState(() {
                controle22.text = '';
                controles22.text = '';
                current_option22 = mode_transfert22[0];
              });
              Get.off(() => const Paiement_facture());
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
