import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_bloc.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_event.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_state.dart';
import 'package:wiso_cash/login/index.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController Nom_Controller = TextEditingController();
  final TextEditingController Prenom_Controller = TextEditingController();
  final TextEditingController Numtel_Controller = TextEditingController();
  final TextEditingController Email_Controller = TextEditingController();
  final TextEditingController Pin_Controller = TextEditingController();
  final TextEditingController Passe_Controller = TextEditingController();
  final TextEditingController Confirm_Controller = TextEditingController();
  IconData vise = Icons.visibility_off_outlined;
  bool _obscure = true;
  bool value_ = true;
  bool red = false;

  @override
  void dispose() {
    super.dispose();
    Nom_Controller.dispose();
    Prenom_Controller.dispose();
    Numtel_Controller.dispose();
    Email_Controller.dispose();
    Pin_Controller.dispose();
    Passe_Controller.dispose();
    Confirm_Controller.dispose();
  }

  final Map<String, String> data = {
    'codeserv': 'enregistrerunclient',
    'noms': '',
    'prenoms': '',
    'numtel': '',
    'email': '',
    'mdp': '',
    'pin': ''
  };

  String url = "iutilisateur.php";
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: BlocListener<BlocBloc, BlocState>(listener: (context, state) {
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
                  Get.defaultDialog(
                    title: 'Félicitation',
                    middleText: register.body?.msg ?? 'Opération réussie',
                    onConfirm: () {
                      red = true;
                      if (red == true) {
                        Get.offAll(
                          () => const Sign_in(),
                          //transition: Transition.size,
                          duration: Durations.medium2,
                        );
                      }
                    },
                  );
                  print(
                      ".........................................mes infos.........................................");
                  print(register.body?.codeenreg);
                  print(register.body?.otpenreg);
                }
              }
            }
          }, child: BlocBuilder<BlocBloc, BlocState>(
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    children: [
                      //entête du login / partie haute
                      const Entete_state(
                        text: 'S\'inscrire',
                      ),

                      //connexion avec Facebook ou Google
                      //const Facebook_Google(),

                      //sizedbox
                      const SizedBox(
                        height: 20,
                      ),

                      //Separation des deux Connexions
                      const separation(),

                      //sizedbox
                      const SizedBox(
                        height: 20,
                      ),

                      //Nom
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: Nom_Controller,
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
                              setState(() {
                                data['noms'] = Nom_Controller.text;
                              });
                              return null;
                            }
                          },
                        ),
                      ),
                      //sizebox
                      const SizedBox(
                        height: 20,
                      ),

                      //Prenom
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: Prenom_Controller,
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
                            labelText: 'Entrez votre prenom',
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                              return 'Entrer un prenom corrects';
                            } else {
                              setState(() {
                                data['prenoms'] = Prenom_Controller.text;
                              });
                              return null;
                            }
                          },
                        ),
                      ),

                      //sizebox
                      const SizedBox(
                        height: 20,
                      ),

                      //telephone
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: Numtel_Controller,
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
                            labelText: 'Entrez votre numéro de téléphone',
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\S\./0-9]+$')
                                    .hasMatch(value)) {
                              return 'Entrer un numéro correct';
                            } else {
                              setState(() {
                                data['numtel'] = Numtel_Controller.text;
                              });
                              return null;
                            }
                          },
                        ),
                      ),

                      //sizebox
                      const SizedBox(
                        height: 20,
                      ),

                      //code PIN
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: Pin_Controller,
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
                            labelText: 'Entrez votre code PIN',
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Entrer un PIN correct';
                            } else {
                              setState(() {
                                data['pin'] = Pin_Controller.text;
                              });
                              return null;
                            }
                          },
                        ),
                      ),

                      //sizebox
                      const SizedBox(
                        height: 20,
                      ),

                      //Connexion par email
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: Email_Controller,
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
                            labelText: 'Entrez votre adresse email',
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[\w-\.]+@([\w-]+\.)[\w-]{2,4}$')
                                    .hasMatch(value)) {
                              return 'Entrer une adresse email correcte';
                            } else {
                              setState(() {
                                data['email'] = Email_Controller.text;
                              });
                              return null;
                            }
                          },
                        ),
                      ),

                      //sizebox
                      const SizedBox(
                        height: 20,
                      ),

                      //Mot de passe
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: Passe_Controller,
                          cursorColor: Theme.of(context).primaryColor,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obscure,
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
                            labelText: 'Entrez votre mot Passe',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscure = !_obscure;
                                  if (_obscure == true) {
                                    vise = Icons.visibility_off_outlined;
                                  } else {
                                    vise = Icons.visibility_outlined;
                                  }
                                });
                              },
                              icon: Icon(vise),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z 0-9]{4,8}$')
                                    .hasMatch(value)) {
                              return 'Entrez un mot de passe correct';
                            } else {
                              setState(() {
                                data['mdp'] = Passe_Controller.text;
                              });
                              return null;
                            }
                          },
                        ),
                      ),

                      //sizebox
                      const SizedBox(
                        height: 20,
                      ),

                      //confirmation du mot de passe
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: Confirm_Controller,
                          cursorColor: Theme.of(context).primaryColor,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obscure,
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
                            labelText: 'Confirmer votre mot de passe',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscure = !_obscure;
                                  if (_obscure == true) {
                                    vise = Icons.visibility_off_outlined;
                                  } else {
                                    vise = Icons.visibility_outlined;
                                  }
                                });
                              },
                              icon: Icon(vise),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z 0-9]{4,8}$')
                                    .hasMatch(value)) {
                              return 'veuillez confirmer le mot de passe';
                            } else if (value != Passe_Controller.text) {
                              return 'le mot de passe ne correspond pas';
                            } else {
                              setState(() {
                                data['mdp'] = Confirm_Controller.text;
                              });
                              return null;
                            }
                          },
                        ),
                      ),

                      //sizebox
                      const SizedBox(
                        height: 20,
                      ),

                      //j'acceptes les conditions d'utilisation du produit
                      Row(
                        children: [
                          Checkbox(
                              value: value_,
                              focusColor: Theme.of(context).primaryColor,
                              activeColor: Theme.of(context).primaryColor,
                              onChanged: (context) {
                                setState(() {
                                  value_ = !value_;
                                });
                              }),
                          const Text(
                            'J\'accepte les',
                            style: TextStyle(color: Colors.black, fontSize: 11),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'conditions d\'utilisation',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 11),
                              )),
                          const Text(
                            'de cette application',
                            style: TextStyle(color: Colors.black, fontSize: 11),
                          )
                        ],
                      ),

                      //sizedbox
                      const SizedBox(
                        height: 10,
                      ),

                      // ignore: unrelated_type_equality_checks
                      state is RegisterLoadingState
                          ? const CircularProgressIndicator()
                          //bouton d'inscription
                          : InkWell(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<BlocBloc>().add(
                                      registerDataEvent(data: data, url: url));
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
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(.3),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                        spreadRadius: 4,
                                      )
                                    ]),
                                child: const Text(
                                  'S\'inscrire',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),

                      //se connecter
                      Padding(
                          padding: const EdgeInsets.only(right: 70),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Vous avez un compte ?',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  'Se connecter',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              );
            },
          )),
        ));
  }
}
