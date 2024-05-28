import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FuncoesTermo extends ChangeNotifier {
  String palavraCerta = 'arroz';
  String palavraRecebida = '';
  List<String> chutes = [];
  bool jogoFinalizado = false;

  final _controllerPalavra = TextEditingController();
  TextEditingController get controllerPalavra => _controllerPalavra;

  void mostrarPalavras(String palavra) {
    List<String> letrasPalavraCerta = palavraCerta.split(''); // [a,r,r,o,z]
    List<String> letrasPalavraChutada = palavra.split(''); // [p,o,r,t,o]
    List<String> letrasNasMesmasPosicoes = [];
    List<String> letrasIguais = [];

    for (int i = 0; i < letrasPalavraCerta.length; i++) {
      
      if (letrasPalavraChutada[i] == letrasPalavraCerta[i]) {
        letrasNasMesmasPosicoes.add(letrasPalavraChutada[i]);
      } else if (letrasPalavraChutada.contains(letrasPalavraCerta[i])) {
        letrasIguais.add(letrasPalavraCerta[i]);
      } 
    }

  }
}

class JogoDoTermo extends StatelessWidget {
  const JogoDoTermo({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<FuncoesTermo>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Center(
          child: Text(
            'JOGO DO TERMO',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
              'Digite uma palavra de 5 letras',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: state._controllerPalavra,
              maxLength: 5,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              decoration: decorationForm('Palavra'),
            ),
            ElevatedButton(
                onPressed: () {
                  state.mostrarPalavras(state._controllerPalavra.text);
                },
                child: const Text('Enviar'))

            
          ],
        ),
      ),
    );
  }
}

InputDecoration decorationForm(String label) {
  return InputDecoration(
    helperStyle: const TextStyle(color: Colors.white),
    label: Text(label),
    labelStyle: const TextStyle(fontSize: 18, color: Colors.white),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide:
          BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 2),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  );
}
