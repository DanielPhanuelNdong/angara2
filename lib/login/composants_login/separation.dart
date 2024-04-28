import 'package:flutter/material.dart';

class separation extends StatefulWidget {
  const separation({super.key});

  @override
  State<separation> createState() => _separationState();
}

class _separationState extends State<separation> {
  @override
  Widget build(BuildContext context) {

    double screen_width = MediaQuery.of(context).size.width;
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    //Premier trait
                    Container(
                      height: 1,
                      width: screen_width * .4,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 201, 200, 200)),
                    ),
                    
                    //deuxième trait
                    Container(
                      height: 1,
                      width: screen_width * .4,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 201, 200, 200)),
                    )
                  ],
                );
  }
}