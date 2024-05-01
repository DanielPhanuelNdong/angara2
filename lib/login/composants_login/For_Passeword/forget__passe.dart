import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiso_cash/login/composants_login/For_Passeword/index.dart';

class Forget_passe extends StatefulWidget {
  const Forget_passe({super.key});

  @override
  State<Forget_passe> createState() => _Forget_passeState();
}

class _Forget_passeState extends State<Forget_passe> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Form(
        key: formKey,
        child: Column(
          
          //image mot de paase oublié
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'images/forget.png',
                height: 300,
                width: 300,
              ),
            ),
        
            //sizebox
            const SizedBox(
              height: 20,
            ),
        
            //texte mot de passe oublié
            Text(
              'Mot de passe oublié',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
        
            //sizebox
            const SizedBox(
              height: 10,
            ),
        
            // texte entrer les informations
            const Text(
              'Renseignez votre adresse email ou votre numéro de téléphone',
              textAlign: TextAlign.center,
            ),
        
            //sizebox
            const SizedBox(
              height: 30,
            ),
        
            //Entrer votre contact ou votre mail
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor.withOpacity(.3),
                          fontWeight: FontWeight.bold),
                        focusColor: Theme.of(context).primaryColor,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).primaryColor,)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).primaryColor,)
                        ),
                  labelText: 'Entrez votre numero / votre email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez renseigner des informations correctes';
                  } else if (!RegExp(
                              r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\S\./0-9]+$')
                          .hasMatch(value) &&
                      !RegExp(r'^[\w-\.]+@([\w-]+\.)[\w-]{2,4}$')
                          .hasMatch(value)) {
                    return 'Veuillez renseigner un numéro / adresse email valide';
                  }
                  return null;
                },
              ),
            ),
        
            //sizebox
            const SizedBox(
              height: 40,
            ),
        
            //bouton continuer
            InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  Get.to(() => const Otp(),
                      transition: Transition.fade,
                      duration: const Duration(seconds: 1));
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
                        color: Theme.of(context).primaryColor.withOpacity(.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                        spreadRadius: 4,
                      )
                    ]),
                child: const Text(
                  'Continue',
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
                ),
      ),
    );
  }
}
