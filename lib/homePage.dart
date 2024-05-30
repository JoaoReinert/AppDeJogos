import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Center(
          child: Text(
            'Home Page',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/jogoDaVelha');
                },
                child: const Text('Jogo Da Velha'),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/jogoDaForca');
                },
                child: const Text('Jogo Da Forca'),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/jogoDoTermo');
                },
                child: const Text('Jogo Do Termo'),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
