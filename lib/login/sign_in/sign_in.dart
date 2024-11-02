import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_bloc.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_event.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_state.dart';
import 'package:wiso_cash/login/index.dart';
import 'package:wiso_cash/page_principale/Nav_Bar_composants/Nav_Bar.dart';

class Sign_in extends StatefulWidget {
  const Sign_in({super.key});

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  final TextEditingController Email_Controller = TextEditingController();
  final TextEditingController Mdp_Controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  IconData vise = Icons.visibility_off;

  bool _obscure = true;
  bool redirige = false;
  final Map<String, String> data = {
    'codeserv': 'seconnecter',
    'profil': 'client',
    'login': '',
    'mdp': '',
    'term': 'Lenovo Android',
    'adrip': '10.0.0.1',
  };

  String url = "isecurite.php";

  @override
  void dispose() {
    super.dispose();
    Email_Controller.dispose();
    Mdp_Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
          child: BlocListener<BlocBloc, BlocState>(
        listener: (context, state) async {
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
                final prefs = await SharedPreferences.getInstance();
                final codeconn = register.body?.connexion?.codeconn;
                final nomsutilis = register.body?.client?.nomsutilis;
                final prenomsutilis = register.body?.client?.prenomsutilis;
                final intitulewallet = register.body?.wallet?.intitulewallet;
                final codewallet = register.body?.wallet?.codewallet;
                if (codeconn != null) {
                  redirige = true;
                  await prefs.setString('codeconn', codeconn);
                } else {
                  await prefs.remove('codeconn');
                }
                if (nomsutilis != null) {
                  await prefs.setString('nomsutilis', nomsutilis);
                } else {
                  await prefs.remove('nomsutilis');
                }
                if (prenomsutilis != null) {
                  await prefs.setString('prenomsutilis', prenomsutilis);
                } else {
                  await prefs.remove('prenomsutilis');
                }
                if (intitulewallet != null) {
                  await prefs.setString('intitulewallet', intitulewallet);
                } else {
                  await prefs.remove('intitulewallet');
                }
                if (codewallet != null) {
                  await prefs.setString('codewallet', codewallet);
                } else {
                  await prefs.remove('codewallet');
                }
                // Affiche une `SnackBar` si `head` est `vrai`
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color.fromARGB(255, 19, 83, 49),
                    content: Text(
                      'Connecté avec succès !!!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
                if (redirige == true) {
                  Get.offAll(
                    () => const acceuil(),
                    //transition: Transition.size,
                    duration: Durations.medium2,
                  );
                }
              }
            }
          }
        },
        child: BlocBuilder<BlocBloc, BlocState>(
          builder: (context, state) => Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  //entête du login / partie haute
                  const Entete_state(
                    text: 'Se connecter',
                  ),

                  //connexion avec Facebook ou Google
                  //const Facebook_Google(),

                  //sizedbox
                  const SizedBox(
                    height: 20,
                  ),

                  //Barre de Separation
                  const separation(),

                  //sizedbox
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
                          return 'Entrer une email correct';
                        } else {
                          setState(() {
                            data['login'] = Email_Controller.text;
                          });
                          return null;
                        }
                      },
                    ),
                  ),

                  //authentification par mot de passe
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: Mdp_Controller,
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
                        labelText: 'Entrez votre mot de Passe',
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
                            !RegExp(r'^[a-z A-Z 0-9\.-]{4,8}$')
                                .hasMatch(value)) {
                          return 'Entrer un mot de passe correct';
                        } else {
                          setState(() {
                            data['mdp'] = Mdp_Controller.text;
                          });
                          return null;
                        }
                      },
                    ),
                  ),

                  //bouton oublier mot de passe
                  Padding(
                    padding: const EdgeInsets.only(left: 180),
                    child: TextButton(
                        onPressed: () {
                          Get.to(() => const Forget_passe(),
                              //transition: Transition.fade,
                              duration: const Duration(seconds: 1));
                        },
                        child: Text('Mot de passe oublié ?',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ))),
                  ),

                  //sizedbox
                  const SizedBox(
                    height: 10,
                  ),

                  state is RegisterLoadingState
                      ? const CircularProgressIndicator()
                      //bouton de connexion
                      : GestureDetector(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              context
                                  .read<BlocBloc>()
                                  .add(registerDataEvent(data: data, url: url));
                            }
                          },
                          child: Container(
                            height: 42,
                            width: screen_width * .88,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).primaryColor,
                                    blurRadius: 2,
                                    offset: const Offset(0, 4),
                                    spreadRadius: 1,
                                  )
                                ]),
                            child: const Text(
                              'Connexion',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),

                  //sizedbox
                  const SizedBox(
                    height: 10,
                  ),

                  //s'inscrire
                  Padding(
                    padding: const EdgeInsets.only(right: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Vous n\'avez pas de compte ?',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => const Sign_up(),
                                //transition: Transition.fade,
                                duration: const Duration(milliseconds: 1000));
                          },
                          child: Text(
                            'S\'inscrire',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
