import 'package:flutter/material.dart';

class Facebook_Google extends StatefulWidget {
  const Facebook_Google({super.key});

  @override
  State<Facebook_Google> createState() => _Facebook_GoogleState();
}

class _Facebook_GoogleState extends State<Facebook_Google> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //bouton facebook
                    InkWell(
                      onTap: () {},
                      child: Container(
                          height: 50,
                          width: screen_width * .4,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor.withOpacity(.1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.facebook,
                                color: Theme.of(context).primaryColor,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Facebook',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 105, 105, 105),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )),
                    ),

                    //bouton Google
                    InkWell(
                      onTap: () {},
                      child: Container(
                          height: 50,
                          width: screen_width * .4,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor.withOpacity(.1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/gg.png',
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Google',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 105, 105, 105),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )),
                    ),
                  ],
                );
  }
}