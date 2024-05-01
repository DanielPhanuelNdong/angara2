import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiso_cash/acceuil/page__acceuil.dart';

class Elements_icones2 extends StatefulWidget {
  const Elements_icones2({super.key});

  @override
  State<Elements_icones2> createState() => _Elements_icones2State();
}

final List<String> mode_transfert = [
  'Mobile Money',
  'Wiso Cash',
  'Mobile Wallet'
];

final formKeyw = GlobalKey<FormState>();
final formKey2w = GlobalKey<FormState>();

TextEditingController controle11 = TextEditingController();
TextEditingController controles11 = TextEditingController();
//String control3 = controle11.text;

String current_option = '';

class _Elements_icones2State extends State<Elements_icones2> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;

    var children = [
      SizedBox(
        height: screen_height * .15,
      ),

      //form pour la recharge
      Form(
        key: formKeyw,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: controle11,
                cursorColor: Theme.of(context).primaryColor,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(.3),
                      fontWeight: FontWeight.bold),
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

            //sizedbox
            const SizedBox(
              height: 30,
            ),

            //Entrer le montant
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: controles11,
                cursorColor: Theme.of(context).primaryColor,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(.3),
                      fontWeight: FontWeight.bold),
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

            //sizedbox
            const SizedBox(
              height: 70,
            ),

            //bouton de confirmation
            InkWell(
              onTap: () {
                if (formKeyw.currentState!.validate()) {
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
                        key: formKey2w,
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
                                  'Vous ête sur le point d\'éffectuer une recharge de ' +
                                      controles11.text +
                                      ' au numéro ' +
                                      controle11.text),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                  'Saisissez votre code PIN pour valider'),

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
                                    labelStyle: TextStyle(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(.3),
                                        fontWeight: FontWeight.bold),
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
                            if (formKey2w.currentState!.validate()) {
                              Get.offAll(() => const acceuil(),
                                  transition: Transition.fade,
                                  duration: const Duration(seconds: 1));
                              setState(() {
                                controle11.text = '';
                                controles11.text = '';
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
          'Recharger',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
