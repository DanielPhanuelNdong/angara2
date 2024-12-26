import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_bloc.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_event.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_state.dart';
import 'package:wiso_cash/page_principale/Nav_Bar_composants/Nav_Bar.dart';

class Elements_Icones extends StatefulWidget {
  const Elements_Icones({super.key});

  @override
  State<Elements_Icones> createState() => _Elements_IconesState();
}

class _Elements_IconesState extends State<Elements_Icones> {
  TextEditingController montant_controle = TextEditingController();
  TextEditingController num_controle = TextEditingController();
  TextEditingController pin_controle = TextEditingController();
//String control2 = controle.text;
  final List<String> mode_transfert = [
    'Mobile Money',
    'Angara Pay',
    'Mobile Wallet'
  ];

  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  IconData vise = Icons.visibility_off;
  //bool _obscure = true;
  String? codewallet = '';

  String current_option = '';
  String cleanedNumber = '';
  String cleanedNumber2 = '';

  @override
  void initState() {
    current_option = mode_transfert[0];
    loadCodeconn();
    super.initState();
  }

  final Map<String, String> data = {
    'codeserv': 'effectuerunenvoiemobilemoney',
    'montant': '',
    'numtel': '',
    'descr': 'RAS',
    'codewallet': '',
    'pin': ''
  };
  final Map<String, String> data2 = {
    'codeserv': 'effectuerunenvoiewallet',
    'montant': '',
    'numcptwallet': '',
    'descr': 'RAS',
    'codewallet': '',
    'pin': ''
  };
  String url = "iwallet.php";
  bool reda = false;

  Future<void> loadCodeconn() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      codewallet = prefs.getString('codewallet');
      data2['codewallet'] = codewallet ?? '';
      data['codewallet'] = codewallet ?? '';
    });
  }

  //late String current_option = mode_transfert[0];
  final maskNumtel = MaskTextInputFormatter(
      mask: '+237 ###-##-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  final maskIdentCpte = MaskTextInputFormatter(
      mask: '+237*********#****',
      filter: {"*": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  void dispose() {
    super.dispose();
    montant_controle.dispose();
    num_controle.dispose();
    pin_controle.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;

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
                montant_controle.text = '';
                num_controle.text = '';
                current_option = mode_transfert[0];
              });
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {
                Get.offAll(() => const acceuil());
                setState(() {
                  montant_controle.text = '';
                  num_controle.text = '';
                  current_option = mode_transfert[0];
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
          print('etat ...................................................');
          print(state);
          print('etat ...................................................');
          if (state is RegisterLoadingState) {
            const CircularProgressIndicator();
          }
          if (state is WebSocketMessageReceivedState) {
            // Accédez à `head` et `body` en toute sécurité après avoir vérifié le type de `state`
            final register = (state).message;
            if (register != null) {
              if (register.head == false) {
                // Affiche une `SnackBar` si `head` est `false`
                Get.back();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color.fromARGB(255, 136, 13, 4),
                    content: Text(
                      'Erreur inconnue',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              } else {
                // Affiche un dialogue si `head` est `true`
                Get.back();
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
                      height: screen_height * .05,
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //textes de confirmation
                            Text(
                              // ignore: prefer_interpolation_to_compose_strings
                              'Opération réussie',
                              style: TextStyle(color: Colors.green),
                            ),
                          ]),
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          reda = true;
                          if (reda == true) {
                            Get.back();
                            // Get.offAll(
                            //   () => const acceuil(),
                            //   //transition: Transition.size,
                            //   duration: Durations.medium2,
                            // );
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
          builder: (context, state) => Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                          controller: num_controle,
                          inputFormatters: current_option == 'Mobile Money'
                              ? [maskNumtel]
                              : [maskIdentCpte],
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
                            if (value!.isEmpty) {
                              return 'Veuillez entrer un numero correct';
                            } else if (current_option == 'Angara Pay') {
                              data2['numcptwallet'] = value;
                              return null;
                            } else if (current_option == 'Mobile Money') {
                              // Supprime uniquement les tirets
                              cleanedNumber =
                                  value.replaceAll(RegExp(r'[-\s]'), '');
                              data['numtel'] = cleanedNumber;
                              return null;
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
                          controller: montant_controle,
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
                                !RegExp(r'^(5|[1-9]\d{0,5}|1000000)$')
                                    .hasMatch(value)) {
                              return 'Veuillez entrer un montant correct';
                            } else {
                              data['montant'] = montant_controle.text;
                              data2['montant'] = montant_controle.text;
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
                      state is RegisterLoadingState
                          ? const CircularProgressIndicator()
                          : InkWell(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  showDialog(
                                    barrierColor: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.2),
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
                                        key: formKey2,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: screen_height * .35,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              //textes de confirmation
                                              Text(
                                                // ignore: prefer_interpolation_to_compose_strings
                                                'Vous ête sur le point d\'éffectuer un envoie de ' +
                                                    montant_controle.text +
                                                    ' au numéro ' +
                                                    num_controle.text,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              const Text(
                                                'Saisissez votre code PIN pour valider',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),

                                              //sizebox
                                              const SizedBox(
                                                height: 30,
                                              ),

                                              //Entrer le code PIN
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: TextFormField(
                                                  controller: pin_controle,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium,
                                                    focusColor:
                                                        Theme.of(context)
                                                            .primaryColor,
                                                    border:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    )),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    )),
                                                    labelText:
                                                        'Entez votre Code PIN',
                                                  ),
                                                  validator: (value) {
                                                    if (value!.isEmpty ||
                                                        !RegExp(r'^[0-9]{5}$')
                                                            .hasMatch(value)) {
                                                      return 'Entrer un code correct';
                                                    } else {
                                                      data['pin'] =
                                                          pin_controle.text;
                                                      data2['pin'] =
                                                          pin_controle.text;
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
                                            if (formKey2.currentState!
                                                .validate()) {
                                              //................................................'Angara Pay'...............................
                                              if (current_option ==
                                                  'Angara Pay') {
                                                Get.back();
                                                // context.read<BlocBloc>().add(
                                                //     registerDataEvent(
                                                //         data: data2, url: url));
                                                context.read<BlocBloc>().add(
                                                    SendMessageEvent(
                                                        message: data2));
                                              }

                                              //................................................'Mobile Money'...............................
                                              if (current_option ==
                                                  'Mobile Money') {
                                                Get.back();
                                                // context.read<BlocBloc>().add(
                                                //     registerDataEvent(
                                                //         data: data, url: url));
                                                context.read<BlocBloc>().add(
                                                    SendMessageEvent(
                                                        message: data));
                                              }
                                              // setState(() {
                                              //   montant_controle.text = '';
                                              //   num_controle.text = '';
                                              //   current_option = mode_transfert[0];
                                              // });
                                            }
                                          },
                                          child: Text(
                                            'Valider',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
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
                                              color: Theme.of(context)
                                                  .primaryColor,
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
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
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
              ],
            ),
          ),
        ),
      )),

      // bottomNavigationBar: const Plage_Accueil(),
    );
  }
}
