import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiso_cash/page_principale/Nav_Bar_composants/Nav_Bar.dart';

class Payer extends StatefulWidget {
  const Payer({super.key});

  @override
  State<Payer> createState() => _PayerState();
}

TextEditingController controle1 = TextEditingController();
TextEditingController controles1 = TextEditingController();
String control3 = controle1.text;

final List<String> mode_transferts = [
  'Mobile Money',
  'Wiso\n Cash',
  'Mobile\n Wallet'
];

final formKeys = GlobalKey<FormState>();
final formKey2s = GlobalKey<FormState>();

String current_option2s = mode_transferts[0];

class _PayerState extends State<Payer> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;

    var children = [
      //sizebox
      SizedBox(
        height: screen_height * .15,
      ),

      Container(
        height: 100,
        width: screen_width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.03),
        ),
        child: Row(
          children: mode_transferts.map((item) {
            return Expanded(
              child: RadioListTile(
                value: item,
                groupValue: current_option2s,
                onChanged: (Value) {
                  setState(() {
                    current_option2s = Value!;
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
        key: formKeys,
        child: Column(
          children: [
            //Entrer le numero
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: controles1,
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
                controller: controle1,
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
                if (formKeys.currentState!.validate()) {
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
                        key: formKey2s,
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
                                  'Vous ête sur le point d\'éffectuer un paiement de ' +
                                      controle1.text +
                                      ' au numéro ' +
                                      controles1.text,
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
                            if (formKey2s.currentState!.validate()) {
                              Get.offAll(() => const acceuil(),
                                  transition: Transition.fade,
                                  duration: const Duration(seconds: 1));
                              setState(() {
                                controle1.text = '';
                                controles1.text = '';
                                current_option2s = mode_transferts[0];
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
