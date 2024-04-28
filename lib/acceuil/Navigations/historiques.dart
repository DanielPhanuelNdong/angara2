import 'package:flutter/material.dart';

class historiques extends StatefulWidget {
  const historiques({super.key});

  @override
  State<historiques> createState() => _historiquesState();
}

class _historiquesState extends State<historiques> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.1),
                ),
                child: Text(
                  'Historiques',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                )),
        ],
      ),
    );
  }
}