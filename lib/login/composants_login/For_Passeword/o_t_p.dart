import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:wiso_cash/login/composants_login/For_Passeword/index.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Center(
            child: Column(
              children: [
                //image OTP
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'images/forget2.png',
                    height: 300,
                    width: 300,
                  ),
                ),

                //Vérification OTP
                Text(
                  'Verification OTP',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),

                //sizebox
                const SizedBox(
                  height: 20,
                ),

                //entrer le code OTP
                const Text('Veuillez entrez le code de vérification'),

                //sizebox
                const SizedBox(
                  height: 20,
                ),

                //Zone d'entrée du code OTP
                const Pinput(),

                //sizebox
                const SizedBox(
                  height: 40,
                ),

                //bouton continuer
                InkWell(
                  onTap: () {
                    Get.to(() => const Reset(),
                        transition: Transition.fade,
                        duration: const Duration(seconds: 1));
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
                            color: Theme.of(context).primaryColor
                                .withOpacity(.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                            spreadRadius: 4,
                          )
                        ]),
                    child: const Text(
                      'Changer le mot de passe',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),

                //sizebox
                const SizedBox(
                  height: 5,
                ),

                //Renvoyer le code OTP par SMS ou par email
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Renvoyer le code à nouveau ?',
                      style: TextStyle(color: Theme.of(context).primaryColor,),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
