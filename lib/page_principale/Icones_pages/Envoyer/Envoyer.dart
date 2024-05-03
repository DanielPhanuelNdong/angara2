import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiso_cash/page_principale/Nav_Bar_composants/Nav_Bar.dart';

class Elements_Icones extends StatefulWidget {
  const Elements_Icones({super.key});

  @override
  State<Elements_Icones> createState() => _Elements_IconesState();
}

TextEditingController controle = TextEditingController();
TextEditingController controles = TextEditingController();
String control2 = controle.text;

class _Elements_IconesState extends State<Elements_Icones> {
  final List<String> mode_transfert = [
    'Mobile Money',
    'Wiso Cash',
    'Mobile Wallet'
  ];

  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  IconData vise = Icons.visibility_off;
  //bool _obscure = true;

  String current_option = '';

  @override
  void initState() {
    current_option = mode_transfert[0];
    super.initState();
  }

  //late String current_option = mode_transfert[0];

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;

    var children = [
      //sizebox
      SizedBox(
        height: screen_height * .10,
      ),

      //modes utilisés
      Column(
        children: mode_transfert.map((item) {
          return RadioListTile(
            value: item,
            groupValue: current_option,
            onChanged: (Value) {
              setState(() {
                current_option = Value!;
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
          );
        }).toList(),
      ),

      //sizebox
      const SizedBox(
        height: 10,
      ),

      //form
      Form(
        key: formKey,
        child: Column(
          children: [
            //Entrer le numero
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: controles,
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
              height: 20,
            ),

            //Entrer le montant
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: controle,
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
              height: 50,
            ),

            //bouton de confirmation
            InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {
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
                        key: formKey2,
                        child: Container(
                          alignment: Alignment.center,
                          height: screen_height * .35,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //textes de confirmation
                              Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  'Vous ête sur le point d\'éffectuer un envoie de ' +
                                      controle.text +
                                      ' au numéro ' +
                                      controles.text,
                                      style: const TextStyle(color: Colors.black),
                                      
                                      ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                  'Saisissez votre code PIN pour valider',
                                  style: TextStyle(color: Colors.black),
                                  ),

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
                            if (formKey2.currentState!.validate()) {
                              Get.offAll(() => const acceuil(),
                                  transition: Transition.fade,
                                  duration: const Duration(seconds: 3));
                                  //const SnackBar(content: Text( 'validé avec succès'));
                              setState(() {
                                controle.text = '';
                                controles.text = '';
                                current_option = mode_transfert[0];
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
          'Mode d\'envoie',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
              setState(() {
                controle.text = '';
                controles.text = '';
                current_option = mode_transfert[0];
              });
            },
            icon: const Icon(Icons.arrow_back)),
            actions: [
          IconButton(
            onPressed: (){
              Get.offAll(() => const acceuil());
              setState(() {
                controle.text = '';
                controles.text = '';
                current_option = mode_transfert[0];
              });
            },
            icon: const Icon(Icons.cancel, size: 35,))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),

      // bottomNavigationBar: const Plage_Accueil(),
    );
  }
}
