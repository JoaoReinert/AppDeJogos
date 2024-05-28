import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Funcoes extends ChangeNotifier {
  bool boleana = true;

  String jogadorAtual = '';
  String jogadorO = 'O';
  String jogadorX = 'X';
  String texto = 'Vez de jogar: X';
  bool jogoFinalizado = false;
  int jogadas = 0;

  List<String> tabuleiro = ['', '', '', '', '', '', '', '', ''];

  bool verificaVencedor() {
    if (tabuleiro[0] == jogadorAtual &&
        tabuleiro[1] == jogadorAtual &&
        tabuleiro[2] == jogadorAtual) {
      return true;
    } else if (tabuleiro[3] == jogadorAtual &&
        tabuleiro[4] == jogadorAtual &&
        tabuleiro[5] == jogadorAtual) {
      return true;
    } else if (tabuleiro[6] == jogadorAtual &&
        tabuleiro[7] == jogadorAtual &&
        tabuleiro[8] == jogadorAtual) {
      return true;
    } else if (tabuleiro[0] == jogadorAtual &&
        tabuleiro[3] == jogadorAtual &&
        tabuleiro[6] == jogadorAtual) {
      return true;
    } else if (tabuleiro[1] == jogadorAtual &&
        tabuleiro[4] == jogadorAtual &&
        tabuleiro[7] == jogadorAtual) {
      return true;
    } else if (tabuleiro[2] == jogadorAtual &&
        tabuleiro[5] == jogadorAtual &&
        tabuleiro[8] == jogadorAtual) {
      return true;
    } else if (tabuleiro[0] == jogadorAtual &&
        tabuleiro[4] == jogadorAtual &&
        tabuleiro[8] == jogadorAtual) {
      return true;
    } else if (tabuleiro[2] == jogadorAtual &&
        tabuleiro[4] == jogadorAtual &&
        tabuleiro[6] == jogadorAtual) {
      return true;
    }
    return false;
  }

  void clicou(int index) {
    if (tabuleiro[index] != '' || jogoFinalizado) {
      return;
    }

    // tabuleiro[index] = boleana ? jogadorX : jogadorO;
    // jogadorAtual = boleana ? jogadorX : jogadorO;
    // jogadas++;

    if (boleana) {
      tabuleiro[index] = jogadorX;
      jogadorAtual = jogadorX;
    } else {
      tabuleiro[index] = jogadorO;
      jogadorAtual = jogadorO;
    }
    jogadas++;
    
    boleana = !boleana;

    if (verificaVencedor()) {
      jogoFinalizado = true;
      texto = '$jogadorAtual venceu';
    } else if (jogadas == 9) {
      jogoFinalizado = true;
      texto = 'Deu velha';
    } else {
      jogadorAtual = boleana ? jogadorX : jogadorO;
      texto = 'Vez de: $jogadorAtual';
    }

    

    notifyListeners();
  }

  Widget mostrarDesenho(index) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.grey,
      child: Center(
        child: Text(
          tabuleiro[index],
          style: const TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}

class JogoDaVelha extends StatelessWidget {
  const JogoDaVelha({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<Funcoes>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Center(
          child: Text(
            'JOGO DA VELHA',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(35),
            child: SizedBox(
              height: 400,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                        onTap: () {
                          state.clicou(index);
                        },
                        child: state.mostrarDesenho(index)),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            state.texto,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
        ],
      ),
    );
  }
}
