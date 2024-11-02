import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:wiso_cash/features/bloc/data/datasources/register_provider.dart';
import 'package:wiso_cash/features/bloc/data/repositories/register_repository.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_bloc.dart';
import 'package:wiso_cash/login/sign_in/sign_in.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(seconds: 7));
  FlutterNativeSplash.remove();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
              create: (context) => DataRepository(dataProvider: DataProvider()))
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      BlocBloc(context.read<DataRepository>())),
            ],
            child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  textTheme: TextTheme(
                    bodyLarge: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    bodyMedium: TextStyle(
                        color: Colors.black.withOpacity(.3),
                        fontWeight: FontWeight.bold),
                  ),
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: const Color(0xFF121214)),
                  primaryColor: const Color(0xFF0119ff),
                  useMaterial3: true,
                ),
                home: const Sign_in())));
  }
}
