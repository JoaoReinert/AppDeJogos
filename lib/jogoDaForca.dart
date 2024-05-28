import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FuncoesForca extends ChangeNotifier {
  String palavra = 'GORILA';
  List<String> letrasChutadas = [];
  int chutes = 8;
  bool jogoFinalizado = false;
  String texto = '';

  final _controllerLetra = TextEditingController();
  TextEditingController get controllerLetra => _controllerLetra;

  String mostrarPalavra() {
    String palavraMostrada = '';

    for (var letra in palavra.split('')) {
      if (letrasChutadas.contains(letra)) {
        palavraMostrada = palavraMostrada + letra;
      } else {
        palavraMostrada = palavraMostrada + ' _ ';
      }
    }
    return palavraMostrada;
  }

  void chutesLetras(String letra) {
    if (jogoFinalizado == false && !letrasChutadas.contains(letra)) {
      letrasChutadas.add(letra);
    }

    if (!palavra.contains(letra)) {
      chutes--;
    }

    if (chutes <= 0) {
      jogoFinalizado = true;
      texto = 'Você perdeu';
    }

    if (!mostrarPalavra().contains('_')) {
      jogoFinalizado = true;
    }
    notifyListeners();
  }
}

class JogoDaForca extends StatelessWidget {
  const JogoDaForca({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<FuncoesForca>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Center(
          child: Text(
            'JOGO DA FORCA',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                height: 50,
                child: Text(
                  'Digite uma letra',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            TextFormField(
              controller: state.controllerLetra,
              maxLength: 1,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              decoration: decorationForm('Letra'),
            ),
            ElevatedButton(
              onPressed: () {
                if (state.jogoFinalizado == false) {
                  state.chutesLetras(state.controllerLetra.text.toUpperCase());
                  state.controllerLetra.clear();
                } else {
                  null;
                }
              },
              child: const Text('Enviar'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              state.mostrarPalavra(),
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Chutes restantes: ${state.chutes}',
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
            if (state.jogoFinalizado)
              if (state.chutes > 0)
                const Text(
                  'Você ganhou!',
                  style: TextStyle(color: Colors.green, fontSize: 30),
                )
              else
                 Text(
                  textAlign: TextAlign.center,
                  'Você perdeu! \n A palavra era: ${state.palavra}',
                  style: const TextStyle(color: Colors.red, fontSize: 30),
                ),
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
