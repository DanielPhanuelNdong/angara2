import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiso_cash/page_principale/Nav_Bar_composants/Nav_Bar.dart';

class recharge_unites extends StatefulWidget {
  const recharge_unites({super.key});

  @override
  State<recharge_unites> createState() => _recharge_unitesState();
}

final List<String> Reseaux = ['MTN', 'Orange', 'Camtel', 'Nexttel'];

final formKey3 = GlobalKey<FormState>();
//IconData vises = Icons.visibility_off;
//bool _obscure = true;

String current_options2 = Reseaux[0];
TextEditingController controle2223 = TextEditingController();

class _recharge_unitesState extends State<recharge_unites> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;

    var children = [
      //sizebox
      SizedBox(
        height: screen_height * .1,
      ),

      //modes utilisés
      Column(
        children: Reseaux.map((item) {
          return RadioListTile(
            value: item,
            groupValue: current_options2,
            onChanged: (Value) {
              setState(() {
                current_options2 = Value!;
                print(current_options2);
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

      //sizedbox
      const SizedBox(
        height: 20,
      ),

      //form
      Form(
        key: formKey3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: controle2223,
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
                      !RegExp(r'^[a-z A-Z 0-9]{4,15}$').hasMatch(value)) {
                    return 'Veuillez entrer un numero correct';
                  } else {
                    return null;
                  }
                },
              ),
            ),

            //sizebox
            const SizedBox(
              height: 40,
            ),

            //bouton de confirmation
            InkWell(
              onTap: () {
                if (formKey3.currentState!.validate()) {
                  // Get.to(() => const Recharge_mode(),
                  //  );

                  //boite de dialogue pour confirmer la recharge dans un reseau precis
                  showDialog(
                    barrierColor:
                        Theme.of(context).primaryColor.withOpacity(.2),
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text(
                        'Voulez-vous vraiment recharger dans $current_options2 ??',
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
                            Get.offAll(() => const Recharge_mode(),
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
          'Recharge unités',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.offAll(() => const acceuil());
              //Get.back(closeOverlays: true);
              //Get.off(() => const recharge_unites());
              setState(() {
                controle2223.text = '';
                current_options2 = Reseaux[0];
              });
            },
            icon: const Icon(Icons.arrow_back)),

            actions: [
          IconButton(
            onPressed: (){
              Get.offAll(() => const acceuil());
              setState(() {
                controle2223.text = '';
                current_options2 = Reseaux[0];
              });
            },
            icon: const Icon(Icons.cancel, size: 35,))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}

//mode de recharge.................................................................................................

class Recharge_mode extends StatefulWidget {
  const Recharge_mode({super.key});

  @override
  State<Recharge_mode> createState() => _Recharge_modeState();
}

TextEditingController controle222 = TextEditingController();
TextEditingController controles222 = TextEditingController();
//String control2 = controle.text;

final List<String> mode_transfert222 = [
  'Mobile Money',
  'Wiso Cash',
  'Mobile Wallet'
];

final formKey232 = GlobalKey<FormState>();
final formKey222 = GlobalKey<FormState>();

String current_option222 = mode_transfert222[0];

class _Recharge_modeState extends State<Recharge_mode> {
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
        children: mode_transfert222.map((item) {
          return RadioListTile(
            value: item,
            groupValue: current_option222,
            onChanged: (Value) {
              setState(() {
                current_option222 = Value!;
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
        height: 40,
      ),

      //form
      Form(
        key: formKey232,
        child: Column(
          children: [
            //Entrer le numero
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: controles222,
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
                controller: controle222,
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
                if (formKey232.currentState!.validate()) {
                  showDialog(
                    barrierColor:
                        Theme.of(context).primaryColor.withOpacity(.2),
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text(
                        'Veuillez Confirmer',
                        style: TextStyle(
                            color:
                                Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      content: Form(
                        key: formKey222,
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
                                      controle222.text +
                                      ' au numéro ' +
                                      controles222.text,
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
                            if (formKey222.currentState!.validate()) {
                              Get.offAll(() => const acceuil(),
                                  transition: Transition.fade,
                                  duration: const Duration(seconds: 1));
                              setState(() {
                                controle222.text = '';
                                controles222.text = '';
                                current_option222 = mode_transfert222[0];
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
          'Mode de recharge',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.off(() => const recharge_unites());
              //Get.back(closeOverlays: true);
              //Get.off(() => const recharge_unites());
              setState(() {
                controle222.text = '';
                controles222.text = '';
                current_option222 = mode_transfert222[0];
              });
            },
            icon: const Icon(Icons.arrow_back)),

            actions: [
          IconButton(
            onPressed: (){
              Get.offAll(() => const acceuil());
              setState(() {
                controle222.text = '';
                controles222.text = '';
                current_option222 = mode_transfert222[0];
              });
            },
            icon: const Icon(Icons.cancel, size: 35,))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
