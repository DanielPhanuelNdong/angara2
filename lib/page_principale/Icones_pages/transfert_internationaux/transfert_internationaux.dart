import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiso_cash/page_principale/index.dart';

class Transfert_internationaux extends StatefulWidget {
  const Transfert_internationaux({super.key});

  @override
  State<Transfert_internationaux> createState() =>
      _Transfert_internationauxState();
}

TextEditingController controle_t = TextEditingController();
TextEditingController controles_t = TextEditingController();

final List<String> mode_transferts_t = ['RIA', 'Western Union', 'Money Gram'];

final formKeys_t = GlobalKey<FormState>();
final formKey_t = GlobalKey<FormState>();

String current_option_t = mode_transferts_t[0];
String? dropdowValue;

class _Transfert_internationauxState extends State<Transfert_internationaux> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;

    var children = [
      const SizedBox(
        height: 40,
      ),

      //modes utilisés
      Column(
        children: mode_transferts_t.map((item) {
          return RadioListTile(
            value: item,
            groupValue: current_option_t,
            onChanged: (Value) {
              setState(() {
                current_option_t = Value!;
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

      //sizebox
      const SizedBox(
        height: 30,
      ),

      //texte
      const Text(
        textAlign: TextAlign.center,
        'vueillez renseigner ci-dessous les informations du bénéficiaire',
        style: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      ),

      //sizebox
      const SizedBox(
        height: 10,
      ),

      //form
      Form(
        key: formKeys_t,
        child: Column(
          children: [
            //Entrer le Nom
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.text,
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
                  labelText: 'Entrez votre nom',
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return 'Entrer un nom correct';
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

            //Entrer l'adresse
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.text,
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
                  labelText: 'Entrez votre adresse',
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value)) {
                    return 'Entrez une adresse correct';
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

            //Entrer le type de piece
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButtonFormField(
                  hint: Text('Sélectionnez le type de pièce', style: Theme.of(context).textTheme.bodyMedium,),
                  disabledHint: const Text(''),
                  value: dropdowValue,
                  items: const [
                    DropdownMenuItem(value: 'CNI', child: Text("CNI")),
                    DropdownMenuItem(
                        value: 'Passeport', child: Text("Passeport"))
                  ],
                  onChanged: (String? newvalue) {
                    setState(() {
                      dropdowValue = newvalue;
                    });
                  },
                  validator: (String? value) {
                    if (value != 'CNI' && value != 'Passeport') {
                      return 'Veuillez sélectionner le type de pièce';
                    } else {
                      return null;
                    }
                  },
                )),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: TextFormField(
            //     keyboardType: TextInputType.text,
            //     decoration: InputDecoration(
            //       labelStyle: Theme.of(context).textTheme.bodyMedium,
            //       focusColor: Theme.of(context).primaryColor,
            //       border: UnderlineInputBorder(
            //           borderSide: BorderSide(
            //         color: Theme.of(context).primaryColor,
            //       )),
            //       focusedBorder: UnderlineInputBorder(
            //           borderSide: BorderSide(
            //         color: Theme.of(context).primaryColor,
            //       )),
            //       labelText: 'Entrez le type de pièce',
            //     ),
            //     validator: (value) {
            //       if (value!.isEmpty ||           !RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value)) {
            //         return 'Entrez une pièce correct';
            //       } else {
            //         return null;
            //       }
            //     },
            //   ),
            // ),

            //sizebox
            const SizedBox(
              height: 20,
            ),

            //Entrer la date d'expiration
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.datetime,
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
                  labelText: 'Entrez la date d\'expiration',
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value)) {
                    return 'Entrez les informations correctes';
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

            //Entrer le numero de la pièce
            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: controles_t,
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
                      labelText: 'Entrez le numéro de la pièce',
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||         !RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value)) {
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

            //bouton de confirmation
            InkWell(
              onTap: () {
                if (formKeys_t.currentState!.validate()) {
                  Get.to(
                    () => const Page2_internationaux(),
                    transition: Transition.size,
                    duration: Durations.medium2,
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

            //sizebox
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transferts Internationaux',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
              setState(() {
                controle_t.text = '';
                controles_t.text = '';
                current_option_t = mode_transferts_t[0];
              });
            },
            icon: const Icon(Icons.arrow_back)),

            actions: [
          IconButton(
            onPressed: (){
              Get.offAll(() => const acceuil());
              setState(() {
                dropdowValue != 'CNI';
                dropdowValue != 'Passeport';
                controle_t.text = '';
                controles_t.text = '';
                current_option_t = mode_transferts_t[0];
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
