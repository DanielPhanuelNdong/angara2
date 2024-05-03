import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiso_cash/page_principale/index.dart';

class Page2_internationaux extends StatefulWidget {
  const Page2_internationaux({super.key});

  @override
  State<Page2_internationaux> createState() => _Page2_internationauxState();
}

TextEditingController controle_t2 = TextEditingController();
TextEditingController controles_t2 = TextEditingController();

final List<String> mode_transferts_t2 = ['RIA', 'Western Union', 'Money Gram'];

final formKeys_t2 = GlobalKey<FormState>();
final formKey_t2 = GlobalKey<FormState>();

String current_option_t2 = mode_transferts_t2[0];

class _Page2_internationauxState extends State<Page2_internationaux> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;

    var children = [
      const SizedBox(
        height: 30,
      ),

      //texte
      const Text(
        textAlign: TextAlign.center,
        'vueillez renseigner ci-dessous les informations d\'envoie',
        style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold),
      ),

      const SizedBox(
        height: 10,
      ),

      //form
      Form(
        key: formKeys_t2,
        child: Column(
          children: [
            //Entrer MTCN
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
                  labelText: 'MTCN',
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

            //Entrer montant
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  labelText: 'Montant',
                ),
                validator: (value) {
                  if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)) {
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

            //Entrer taxe
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  labelText: 'Taxe',
                ),
                validator: (value) {
                  if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)) {
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

            //Entrer Total
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  labelText: 'Total',
                ),
                validator: (value) {
                  if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)) {
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

            //Entrer Pays
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: controles_t2,
                cursorColor: Theme.of(context).primaryColor,
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
                  labelText: 'Pays',
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

            //Entrer taxe change
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  labelText: 'Taxe change',
                ),
                validator: (value) {
                  if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Entrez les informations correctes';
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

            //telechargement fichier

            //bouton de confirmation
            InkWell(
              onTap: () {
                if (formKeys_t2.currentState!.validate()) {
                  Get.to(
                    () => const Photo_CNI_Passeport(),
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
                controle_t2.text = '';
                controles_t2.text = '';
                current_option_t2 = mode_transferts_t2[0];
              });
            },
            icon: const Icon(Icons.arrow_back)),

            actions: [
          IconButton(
            onPressed: (){
              Get.offAll(() => const acceuil());
              setState(() {
                controle_t2.text = '';
                controles_t2.text = '';
                current_option_t2 = mode_transferts_t2[0];
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
