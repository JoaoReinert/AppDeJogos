import 'package:flutter/material.dart';
import 'package:jogos/jogoDoTermo.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
     return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: JogoDoTermo(),
    );
  }
}
