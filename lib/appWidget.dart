

import 'package:flutter/material.dart';
import 'package:jogos/homePage.dart';
import 'package:jogos/jogoDaForca.dart';
import 'package:jogos/jogoDaVelha.dart';
import 'package:jogos/jogoDoTermo.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home' : (context) => const HomePage(),
        '/jogoDaVelha' : (context) => const JogoDaVelha(),
        '/jogoDoTermo' : (context) => const JogoDoTermo(),
        '/jogoDaForca' :(context) => const JogoDaForca(),
      },
        debugShowCheckedModeBanner: false,
    );
  }
}
