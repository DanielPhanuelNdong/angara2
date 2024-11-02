import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_bloc.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_event.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_state.dart';
import 'package:wiso_cash/page_principale/Nav_Bar_composants/Nav_Bar.dart';

class Elements_icones2 extends StatefulWidget {
  const Elements_icones2({super.key});

  @override
  State<Elements_icones2> createState() => _Elements_icones2State();
}

class _Elements_icones2State extends State<Elements_icones2> {
  final formKeyw = GlobalKey<FormState>();
  final formKey2w = GlobalKey<FormState>();

  TextEditingController montant_controle1 = TextEditingController();
  TextEditingController num_controle1 = TextEditingController();

  final Map<String, String> data1 = {
    'codeserv': 'effectuerunerechargemobilemoney',
    'montant': '',
    'numtel': '',
    'descr': 'RAS',
    'codewallet': ''
  };

  String url1 = "iwallet.php";
  bool rede = false;
//String control3 = controle11.text;

  String? codewallet = '';

  String current_option = '';

  @override
  void initState() {
    loadCodeconn();
    super.initState();
  }

  Future<void> loadCodeconn() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      codewallet = prefs.getString('codewallet');
      data1['codewallet'] = codewallet ?? '';
    });
  }
  //late String current_option = mode_transfert[0];

  @override
  void dispose() {
    super.dispose();
    montant_controle1.dispose();
    num_controle1.dispose();
  }

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
                controller: num_controle1,
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
                    data1['numtel'] = num_controle1.text;
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
                controller: montant_controle1,
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
                  if (value!.isEmpty || !RegExp(r'^[0-9]$').hasMatch(value)) {
                    return 'Veuillez entrer un montant correct';
                  } else {
                    data1['montant'] = montant_controle1.text;
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
                  rede = true;
                  if (rede) {
                    context
                        .read<BlocBloc>()
                        .add(registerDataEvent(data: data1, url: url1));
                  }
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
        actions: [
          IconButton(
              onPressed: () {
                Get.offAll(() => const acceuil());
                setState(() {
                  montant_controle1.text = '';
                  num_controle1.text = '';
                });
              },
              icon: const Icon(
                Icons.cancel,
                size: 35,
              ))
        ],
      ),
      body: SingleChildScrollView(
          child: BlocListener<BlocBloc, BlocState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            // Accédez à `head` et `body` en toute sécurité après avoir vérifié le type de `state`
            final register = (state).register;
            if (register != null) {
              if (register.head == false) {
                // Affiche une `SnackBar` si `head` est `false`
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: const Color.fromARGB(255, 136, 13, 4),
                    content: Text(
                      register.body?.msg ?? 'Erreur inconnue',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              } else {
                // Affiche un dialogue si `head` est `true`
                showDialog(
                  barrierColor: Theme.of(context).primaryColor.withOpacity(.2),
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text(
                      'Félicitations',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    content: Container(
                      alignment: Alignment.center,
                      height: screen_height * .35,
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //textes de confirmation
                            Text(
                              // ignore: prefer_interpolation_to_compose_strings
                              'Recharge initiée avec succès !!!. Veuillez la confirmer sur votre mobile',
                              style: TextStyle(color: Colors.green),
                            ),
                          ]),
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          rede = true;
                          if (rede == true) {
                            Get.offAll(
                              () => const acceuil(),
                              //transition: Transition.size,
                              duration: Durations.medium2,
                            );
                          }
                        },
                        child: Text(
                          'OK',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }
          }
        },
        child: BlocBuilder<BlocBloc, BlocState>(
          builder: (context, state) => Column(
            children: children,
          ),
        ),
      )),
    );
  }
}
