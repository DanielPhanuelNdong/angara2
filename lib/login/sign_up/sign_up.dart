import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiso_cash/login/index.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController Passe_Controller = TextEditingController();
  final TextEditingController Confirm_Controller = TextEditingController();
  IconData vise = Icons.visibility_off_outlined;
  bool _obscure = true;
  bool value_ = true;
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
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

                //Nom et Prenom
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
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
                      labelText: 'Entrez votre nom et prenom',
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]{1-50}+$').hasMatch(value)) {
                        return 'Entrer un nom et prenom corrects';
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

                //telephone
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
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
                      labelText: 'Entrez votre numéro',
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\S\./0-9]+$')
                              .hasMatch(value)) {
                        return 'Entrer un numéro correct';
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

                //code PIN
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
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
                          !RegExp(r'^[0-9]{1-5}+$')
                              .hasMatch(value)) {
                        return 'Entrer un PIN correct';
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

                //Connexion par email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
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
                          !RegExp(r'^[a-z A-Z 0-9]{4,8}$').hasMatch(value)) {
                        return 'Entrez un mot de passe correct';
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
                          !RegExp(r'^[a-z A-Z 0-9]{4,8}$').hasMatch(value)) {
                        return 'veuillez confirmer le mot de passe';
                      } else if (value != Passe_Controller.text) {
                        return 'le mot de passe ne correspond pas';
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

                //bouton d'inscription
                InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Get.back();
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
                            color:
                                Theme.of(context).primaryColor.withOpacity(.3),
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
        ),
      ),
    );
  }
}
