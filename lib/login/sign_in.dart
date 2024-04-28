import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiso_cash/acceuil/page__acceuil.dart';
import 'package:wiso_cash/login/index.dart';

class Sign_in extends StatefulWidget {
  const Sign_in({super.key});

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  final formKey = GlobalKey<FormState>();
  IconData vise = Icons.visibility_off;
  bool _obscure = true;
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
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
                  const Facebook_Google(),

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
                      decoration: InputDecoration(
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor,),
                        focusColor: Theme.of(context).primaryColor,
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,)),
                        labelText: 'Entrez votre adresse email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)[\w-]{2,4}$')
                                .hasMatch(value)) {
                          return 'Entrer une email correct';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  //authentification par mot de passe
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      cursorColor: Theme.of(context).primaryColor,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscure,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor,),
                        focusColor: Theme.of(context).primaryColor,
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,)),
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
                            !RegExp(r'^[a-z A-Z 0-9]{4,8}$').hasMatch(value)) {
                          return 'Entrer un mot de passe correct';
                        } else {
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
                              transition: Transition.fade,
                              duration: const Duration(seconds: 1));
                        },
                        child: Text('Mot de passe oublié ?',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,))),
                  ),

                  //sizedbox
                  const SizedBox(
                    height: 10,
                  ),

                  //bouton de connexion
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Get.offAll(() => const acceuil(),
                        transition: Transition.size,
                        duration: Durations.medium2,
                        );
                      }
                    },
                    child: Container(
                      height: 60,
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
                                transition: Transition.fade,
                                duration: const Duration(milliseconds: 1000));
                          },
                          child: Text(
                            'S\'inscrire',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,),
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
      ),
    );
  }
}
