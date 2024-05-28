import 'package:flutter/material.dart';
import 'package:jogos/jogoDaForca.dart';
import 'package:jogos/jogoDaVelha.dart';
import 'package:jogos/jogoDoTermo.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
     return //MultiProvider(
    //   providers: [
    //     Provider<Funcoes>(create: (_) => Funcoes()),
    //     Provider<FuncoesForca>(create: (_) => FuncoesForca(),)
    //   ],
    ChangeNotifierProvider(
      create: (_) => FuncoesTermo(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: JogoDoTermo(),
      ),
    );
  }
}