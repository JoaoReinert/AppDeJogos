import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FuncoesTermo extends ChangeNotifier {
  String palavraCerta = 'arroz';
  String palavraRecebida = '';
  List<String> chutes = [];
  bool jogoFinalizado = false;
  List<List<Color>> letrasColoridas = [];

  final _controllerPalavra = TextEditingController();
  TextEditingController get controllerPalavra => _controllerPalavra;

  void separandoLetras(String palavra) {
    if (chutes.length >= 6 || jogoFinalizado) return;

    List<String> letrasPalavraCerta = palavraCerta.split(''); // [a,r,r,o,z]
    List<String> letrasPalavraChutada = palavra.split(''); // [p,o,r,t,o]
    List<Color> cores = List.filled(5, Colors.grey);

    for (int i = 0; i < letrasPalavraChutada.length; i++) {
      if (letrasPalavraChutada[i] == letrasPalavraCerta[i]) {
        cores[i] = Colors.green;
      } else if (letrasPalavraCerta.contains(letrasPalavraChutada[i])) {
        cores[i] = Colors.yellow;
      }
    }
    chutes.add(palavra);
    letrasColoridas.add(cores);

    if (palavra == palavraCerta) {
      jogoFinalizado = true;
    } else if (chutes.length >= 6) {
      jogoFinalizado = true;
    }
    controllerPalavra.clear();
    notifyListeners();
  }
}

class JogoDoTermo extends StatelessWidget {
  const JogoDoTermo({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FuncoesTermo(),
      child: Consumer<FuncoesTermo>(builder: (_, state, __) {
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
                      if (state._controllerPalavra.text.length == 5) {
                        state.separandoLetras(state.controllerPalavra.text);
                      }
                    },
                    child: const Text('Enviar')),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.chutes.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: List.generate(
                          5,
                          (i) {
                            return Container(
                              margin: const EdgeInsets.all(2),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: state.letrasColoridas[index][i],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                state.chutes[index][i],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
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
