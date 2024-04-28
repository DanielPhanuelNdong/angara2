import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiso_cash/login/sign_in.dart';

class Reset extends StatefulWidget {
  const Reset({super.key});

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  final formKey = GlobalKey<FormState>();
  IconData vise = Icons.visibility_off;
  bool _obscure = true;
  TextEditingController PassewordController = TextEditingController();
  TextEditingController ConfirmPassewordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              //image de mot de paase oublié
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'images/forget3.png',
                    height: 300,
                    width: 300,
                  ),
                ),

                //sizebox
                const SizedBox(
                  height: 25,
                ),

                //texte mot de passe oublié
                Text(
                  textAlign: TextAlign.center,
                  'Réinitialisation du mot de passe',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),

                //sizebox
                const SizedBox(
                  height: 10,
                ),

                // texte entrer les informations
                const Text(
                  'Veuillez renseigner et confirmer le nouveau mot de passe',
                  textAlign: TextAlign.center,
                ),

                //sizebox
                const SizedBox(
                  height: 30,
                ),

                //Entrer votre nouveau mot de passe
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: PassewordController,
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
                      labelText: 'Entrez votre Passe entre 4 et 8 caractères',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscure = !_obscure;
                            if (_obscure == true) {
                              vise = Icons.visibility_off;
                            } else {
                              vise = Icons.visibility;
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

                //confirmation du mot de passe
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: ConfirmPassewordControler,
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
                      labelText: 'Confirmez votre mot de passe',
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
                      } else if (value != PassewordController.text) {
                        return 'mot de passe différent';
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

                //bouton Enrégistrer
                InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      showDialog(
                        barrierColor: Theme.of(context).primaryColor.withOpacity(.2),
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Succès'),
                          content:
                              const Text('Mot de passe modifier avec succès'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Get.offAll(() => const Sign_in(),
                                    transition: Transition.fade,
                                    duration: const Duration(seconds: 1));
                              },
                              child: Text('Okay', style: TextStyle(color: Theme.of(context).primaryColor,),),
                            ),
                          ],
                        ),
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
                            color: Theme.of(context).primaryColor.withOpacity(.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                            spreadRadius: 4,
                          )
                        ]),
                    child: const Text(
                      'Enrégistrer',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),

                //sizebox
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
