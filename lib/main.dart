import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiso_cash/login/sign_in.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF121214)),
          primaryColor: const Color(0xFF0119ff),
          useMaterial3: true,
        ),
        home: const Sign_in());
  }
}
