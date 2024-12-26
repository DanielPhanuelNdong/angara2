import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:wiso_cash/features/bloc/data/datasources/register_provider.dart';
import 'package:wiso_cash/features/bloc/data/datasources/websocket_service.dart';
import 'package:wiso_cash/features/bloc/data/repositories/register_repository.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_bloc.dart';
import 'package:wiso_cash/login/sign_in/sign_in.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(seconds: 7));
  FlutterNativeSplash.remove();

  final webSocketService = WebSocketService();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WebSocketService>(
            create: (context) => webSocketService),
        RepositoryProvider(
            create: (context) => DataRepository(dataProvider: DataProvider())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          // BlocProvider(
          //     create: (context) =>
          //         BlocBloc2(RepositoryProvider.of<WebSocketService>(context))),
          BlocProvider(
              create: (context) => BlocBloc(context.read<DataRepository>(),
                  context.read<WebSocketService>())),
        ],
        child: GetMaterialApp(
          //navigatorKey: navigatorKey,
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
          home: const Sign_in(),
        ));
    //const Sign_in());
  }
}
