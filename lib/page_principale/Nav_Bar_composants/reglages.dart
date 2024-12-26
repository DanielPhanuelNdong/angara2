import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wiso_cash/features/bloc/data/datasources/register_provider.dart';
import 'package:wiso_cash/features/bloc/data/repositories/register_repository.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_bloc.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_event.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_state.dart';
import 'package:wiso_cash/login/sign_in/sign_in.dart';

class Reglages extends StatefulWidget {
  const Reglages({super.key});

  @override
  State<Reglages> createState() => _ReglagesState();
}

class _ReglagesState extends State<Reglages> {
  final Map<String, String> data = {
    'codeserv': 'sedeconnecter',
    'codeconn': '',
  };

  String url = "isecurite.php";

  @override
  void initState() {
    super.initState();
    loadCodeconn(); // Appelle la méthode pour charger les données
  }

  Future<void> loadCodeconn() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      final codeconn = prefs.getString('codeconn');
      data['codeconn'] = codeconn ?? '';
    });
  }

  //final webSocketService = WebSocketService();

  @override
  Widget build(BuildContext context) {
    //double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return RepositoryProvider(
      create: (context) => DataRepository(dataProvider: DataProvider()),
      child: BlocListener<BlocBloc, BlocState>(
          listener: (context, state) async {
            if (state is RegisterSuccessState) {
              // Accédez à `head` et `body` en toute sécurité après avoir vérifié le type de `state`
              final register = (state).register;
              if (register != null) {
                if (register.head == false) {
                  // Affiche une `SnackBar` si `head` est `false`
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: const Color.fromARGB(255, 136, 13, 4),
                      content: Text(
                        register.body?.msg ?? 'Erreur inconnue',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                } else {
                  // Affiche une `SnackBar` si `head` est `vrai`
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color.fromARGB(255, 19, 83, 49),
                      content: Text(
                        'Déconnecté avec succès !!!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                  Get.offAll(
                    () => const Sign_in(),
                    //transition: Transition.size,
                    duration: Durations.medium2,
                  );

                  //webSocketService.dispose();
                  //context.read<BlocBloc>().add(DisposeEvent());
                  final prefs = await SharedPreferences.getInstance();

                  await prefs.remove('codeconn');
                  await prefs.remove('nomsutilis');
                  await prefs.remove('prenomsutilis');
                  await prefs.remove('prenomsutilis');
                  await prefs.remove('codewallet');
                }
              }
            }
            if (state is WebSocketDisposeState) {
              print('le messssssssssssssssssssssssssssssssssssssss');
            }
          },
          child: BlocBuilder<BlocBloc, BlocState>(
            builder: (context, state) => Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //titre Reglages
                  Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(.1),
                      ),
                      child: Text(
                        'Réglages',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      )),

                  //sizebox
                  const SizedBox(
                    height: 30,
                  ),

                  //se déconnecter
                  TextButton(
                      onPressed: () {
                        showDialog(
                          barrierColor:
                              Theme.of(context).primaryColor.withOpacity(.2),
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text(
                              'Confirmation',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Container(
                              alignment: Alignment.center,
                              height: screen_height * .05,
                              child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //textes de confirmation
                                    Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      'Voulez-vous vraiment vous déconnecter ?',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ]),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  context.read<BlocBloc>().add(
                                      registerDataEvent(data: data, url: url));
                                  // context.read<BlocBloc>().add(DisposeEvent());
                                },
                                child: Text(
                                  'OUI',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  'Annuler',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text('Se déconnecter',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).primaryColor.withOpacity(.6),
                          ))),

                  //divider
                  const Divider(),

                  //sizebox
                  const SizedBox(
                    height: 10,
                  ),

                  //partager l'application
                  GestureDetector(
                    onTap: () {
                      Share.share('com.example.wiso_cash');
                    },
                    child: const ListTile(
                      leading: Icon(Icons.share),
                      title: Text('Partager l\'application'),
                    ),
                  ),

                  //Nous contacter
                  GestureDetector(
                    onTap: () async {
                      final Uri url = Uri(
                        scheme: 'tel',
                        path: '+237692494794',
                      );
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        print('cannot launch this tel');
                      }
                    },
                    child: const ListTile(
                      leading: Icon(Icons.call),
                      title: Text('Nous contacter'),
                    ),
                  ),

                  //Renseignez-vous sur nous
                  GestureDetector(
                    onTap: () {},
                    child: const ListTile(
                      leading: Icon(Icons.list),
                      title: Text('A propos de nous'),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
